<?php

namespace App\Http\Controllers;

use App\Models\Full_time_payment;
use App\Models\Part_time_payment;
use App\Models\Useroption;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class paymentController extends Controller
{
    public function __construct()
    {
        return $this->middleware('auth:api');
    }
    public function userPaymentDetails(){
        $uid = auth()->user()->id;
        $useroption = Useroption::where('user_id', $uid)->first();
        return response()->json($useroption);
    }

    public function payments(Request $req){
        // $data = $req->input();
        $money = 1;
        $option = Useroption::where('user_id', auth()->user()->id)->first();
        if($option->level->type->typeName == 'partTime'){
            $money = 1;
        } else {
            $money = 1;
        }

        $phoneNumber = $req['phoneNumber'];
        $currency = $req['currency'];
        $country = $req['country'];
        // return response()->json(['data-sent' => [$phoneNumber, $currency, $country, $money, $option]]);

        $data = array(
            'service' => '5sMccBwuw2NDOn0Z7Iipz80tpEfEh6zg',
            'service_secret' => 'x32XtxUzhSP4crtBkhSp4mQevvBCzDMGkQefeYmD21uRUzN6Lnr1xLkNs2vWJKYL',
            'phonenumber' => $phoneNumber,
            'amount' => $money,
            'currency' => $currency,
            'country' => $country,
            'locale' => 'en',
            'item_ref' => $phoneNumber,
            // 'payment_ref' => $phoneNumber + $level->level_id + auth()->user()->id,
            'user' => auth()->user()->fullName
            );
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, 'https://api.monetbil.com/payment/v1/placePayment');
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($ch, CURLOPT_HEADER, 0);
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
            curl_setopt($ch, CURLOPT_TIMEOUT, 30);
            $json = curl_exec($ch);
            $httpcode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            $jsonArry = json_decode($json, true);

            return response()->json($jsonArry);
    }

    function checkPayment(Request $req){
        $paymentId = $req['paymentId'];
        $data = array(
            'paymentId' => $paymentId
            );
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, 'https://api.monetbil.com/payment/v1/checkPayment');
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($ch, CURLOPT_HEADER, 0);
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data, '', '&'));
            curl_setopt($ch, CURLOPT_TIMEOUT, 30);
            $json = curl_exec($ch);
            $jsonArry = json_decode($json, true);
            if (is_array($jsonArry) and array_key_exists('transaction', $jsonArry)) {
                $transaction = $jsonArry['transaction'];
                $status = $transaction['status'];
                if ($status == 1) {
                    // Successful payment
                    return "PAYMENT_SUCCESSFUL";
                } elseif ($status == - 1) {
                    // Transaction cancelled
                    return "TRANSACTION_CANCIL";
                } else {
                    // Payment failed
                    return "PAYMENT_FAIL";
                }
            }
            else {
                return "TRANSACTION_IN_PROGRESS";
            }
    }

    public function registerPayments(Request $req){
        $userId = auth()->user()->id;
        $phoneNumber = $req['phoneNumber'];
        $option = Useroption::where('user_id', $userId)->first();
        if($option->level->type->typeName == 'partTime'){
            $date = time() + 2592000;
            $next_date = date('yy-M-d h:m:s', strtotime("+30 days"));
            $amount = 1;
        } else {
            $date = time() + 2592000*12;
            $next_date = date('yy-M-d h:m:s', strtotime("+12 months"));
            $amount = 1;
        }
        DB::table('useroptions')->where('user_id', $userId)->update([
            'amount' => $amount,
            'paid_amount' => $amount,
            'balance' => 0,
            'amount' => $amount,
            'deadLine' => $date,
            'formate_deadline' => $next_date
        ]);
         //registring part time user
        if($option->level->type->typeName == 'partTime'){
            $partime = new Part_time_payment();
            $partime->user_id = $userId;
            $partime->amount = $amount;
            $partime->phoneNumber = $phoneNumber;
            $partime->paymentDate = date('yy-M-d h:m:s', strtotime('today'));
            $partime->save();
            $userDetail = Useroption::where('user_id', auth()->user()->id)->first();
            return response()->json($userDetail);
        }

        // full time students
        else {
            $fulltime = new Full_time_payment();
            $fulltime->user_id = $userId;
            $fulltime->year = date('Y', strtotime('today'));
            $fulltime->phoneNumber = $phoneNumber;
            $fulltime->amount = $amount;
            $fulltime->paymentMonths = date('yy-M-d h:m:s', strtotime('today'));
            $fulltime->save();
            $userDetail = Useroption::where('user_id', auth()->user()->id)->first();
            return response()->json($userDetail);
        }
        return response()->json();
    }
}
