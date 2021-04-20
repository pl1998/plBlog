<?php
/**
 * Created By PhpStorm.
 * User : Latent
 * Date : 2021/4/7
 * Time : 3:45 下午
 **/

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Pl1998\ThirdpartyOauth\SocialiteAuth;
use Symfony\Component\HttpFoundation\Cookie;



class OauthController extends Controller
{
    public function githubCallBack()
    {
        $auth = new SocialiteAuth(config('oauth.github'));
        $user = $auth->driver('github')->user();

        $users = User::query()->where('oauth_id',$user->id)->first();

        if(!$users){
            $users= User::query()->create([
                'name'=> empty($user->name) ?? $user->login,
                'email'=>$user->email,
                'avatar'=>$user->avatar_url,
                'oauth_id'=>$user->id,
                'bound_oauth'=>1
            ]);
        }
        return $this->respondWithToken($users);
    }

    public function giteeCallBack()
    {
        $auth = new SocialiteAuth(config('oauth.gitee'));
        $user = $auth->driver('gitee')->user();

        $users = User::query()->where('oauth_id',$user->id)->first();

        if(!$users){
            $users= User::query()->create([
                'name'=>$user->name,
                'email'=>$user->email,
                'avatar'=>$user->avatar_url,
                'oauth_id'=>$user->id,
                'bound_oauth'=>2
            ]);
        }
        return $this->respondWithToken($users);
    }

    public function weiboCallBack()
    {
        $auth = new SocialiteAuth(config('oauth.weibo'));
        $user = $auth->driver('weibo')->user();

        $users = User::query()->where('oauth_id',$user->id)->first();

        if(!$users){
            $users= User::query()->create([
                'name'=>$user->name,
                'email'=>'',
                'avatar'=>$user->avatar_large,
                'oauth_id'=>$user->id,
                'bound_oauth'=>2
            ]);
        }
        return $this->respondWithToken($users);
    }

    public function respondWithToken($users)
    {
        $token = Auth::guard('api')->login($users);
        $url   = env('VUE_CALLBACK_URL').'?token='.$token;
        return redirect($url)->with('token',$token);

    }
}
