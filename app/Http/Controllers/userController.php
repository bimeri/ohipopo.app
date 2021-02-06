<?php

namespace App\Http\Controllers;

use App\Models\Level;
use App\Models\Subject;
use App\Models\Type;
use App\Models\User;
use App\Models\Useroption;
use App\Models\Usersubject;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Exception;

class userController extends Controller
{
    public function __construct()
    {
    //    return $this->middleware('auth:api');
    }

    public function types(){
        $type = Type::getAllType();

        return response()->json($type, 200, [
            'Content-Type' => 'application/json',
            'Accept' => 'application/json',
            'Authorization' => 'Bearer '], 0);
    }

    public function levels(Request $req){
        $typeId = $req['typeId'];
        $level = Level::getLevelByType($typeId);

        return response()->json($level, 200, [
            'Content-Type' => 'application/json',
            'Accept' => 'application/json',
            'Authorization' => 'Bearer '], 0);
    }

    public function login(Request $request) {

        $request->validate([
            'userName' => 'required',
            'password' => 'required|string',
            'remember_me' => 'boolean'
        ]);
        $email = $request['userName'];
        $password = $request['password'];

        if($request['userId']) {
            User::where('id', $request['userId'])->update(['isLogin' => 0]);
        }

        if(Auth::attempt(['userName' => $email, 'password' => $password, 'isLogin' => 1])){
            return response()->json("IS_LOGGED_IN");
        }

        if(Auth::attempt(['userName' => $email, 'password' => $password, 'isLogin' => 0])){
            $user = $request->user();
            $tokenResult = $user->createToken('PERSONAL_ACCESS_TOKEN');
            $token = $tokenResult->token;
            if ($request->remember_me) {
                $token->expires_at = Carbon::now()->addWeeks(1);
            }
            $token->save();
            User::where('id', auth()->user()->id)->update(['isLogin' => 1]);
            return response()->json([
                'accessToken' => $tokenResult->accessToken,
                'type' => 'Bearer',
                'expires_at' => Carbon::parse($tokenResult->token->expires_at),
                ['userInfo' => auth()->user()],
                ['userDetails' => Useroption::where('user_id', auth()->user()->id)->first()]
            ]);
        }
        else {
            return response()->json([
                'message' => 'Unauthorized fail to login'
            ], 406);
        }
    }


    public function register(Request $request)
    {
        $request->validate([
            'fullName' => 'required|string',
            'phoneNumber' => 'required|string',
            'userName' => 'required|string|unique:App\Models\User,userName',
            'password' => 'required|string'
        ]);
        //requesting the data
        $fname = $request['fullName'];
        $phone = $request['phoneNumber'];
        $uname = $request['userName'];
        $email = $request['email'];
        $level = $request['level'];
        $address = $request['address'];
        $dob = $request['dateOfBirth'];
        $password = $request['password'];

        $user = new User;
        $user->fullName = $fname;
        $user->phoneNumber = $phone;
        $user->UserName = $uname;
        $user->email = $email;
        $user->address = $address;
        $user->date_of_birth = $dob;
        $user->password = bcrypt($password);
        $user->status = 0;

       try{
        $user->save();
            $userId = User::getUserId($fname, $phone);
            $userInfo = new Useroption();

            $userInfo->user_id = $userId;
            $userInfo->level_id = $level;
            $userInfo->subscribed = 0;

            $userInfo->save();
            return response()->json([
                'message' => 'Successfully created user!'
            ], 201);

        } catch(Exception $e){
            return response()->json([
                'message' => 'PHONE_EXIST'
            ], 401);
        }
    }
    /**
     * Get the authenticated User
     *
     * @return [json] user object
     */
    public function homePage()
    {
        return view('home');
    }
}
