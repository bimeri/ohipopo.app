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
use Auth;
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
            'phoneNumber' => 'required',
            'password' => 'required|string',
            'remember_me' => 'boolean'
        ]);
        $credentials = request(['phoneNumber', 'password']);
        if(Auth::attempt($credentials)){
            $user = $request->user();
            $tokenResult = $user->createToken('PERSONAL_ACCESS_TOKEN');
            $token = $tokenResult->token;
            if ($request->remember_me)
                $token->expires_at = Carbon::now()->addHours(1);
            $token->save();
            return response()->json([
                'accessToken' => $tokenResult->accessToken,
                'type' => 'Bearer',
                'expires_at' => Carbon::parse($tokenResult->token->expires_at)->toDateTimeString(),
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
            'phoneNumber' => 'required|string|unique:App\Models\User,phoneNumber',
            'email' => 'required|string|email|unique:App\Models\User,email',
            'password' => 'required|string'
        ]);
        //requesting the data
        $fname = $request['fullName'];
        $phone = $request['phoneNumber'];
        $email = $request['email'];
        $level = $request['level'];
        $address = $request['address'];
        $dob = $request['dateOfBirth'];
        $password = $request['password'];

        $user = new User;
        $user->fullName = $fname;
        $user->phoneNumber = $phone;
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
