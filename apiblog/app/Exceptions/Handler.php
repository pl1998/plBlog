<?php

namespace App\Exceptions;

use App\Traits\Response;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Illuminate\Support\Str;
use Illuminate\Validation\ValidationException;
use Symfony\Component\HttpKernel\Exception\MethodNotAllowedHttpException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\HttpKernel\Exception\UnauthorizedHttpException;
use Throwable;

class Handler extends ExceptionHandler
{

    use Response;
    /**
     * A list of the exception types that are not reported.
     *
     * @var array
     */
    protected $dontReport = [
        //
    ];

    /**
     * A list of the inputs that are never flashed for validation exceptions.
     *
     * @var array
     */
    protected $dontFlash = [
        'current_password',
        'password',
        'password_confirmation',
    ];

    /**
     * Register the exception handling callbacks for the application.
     *
     * @return void
     */
    public function register()
    {
        $this->reportable(function (Throwable $e) {

        });
    }


    /**
     * Render an exception into an HTTP response.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Throwable  $exception
     * @return \Symfony\Component\HttpFoundation\Response
     *
     * @throws \Throwable
     */
    public function render($request, Throwable $exception)
    {
        if(Str::lower($request->segment(1)) === 'api'){
            if ($exception instanceof ValidationException) {
                return $this->fail($exception->validator->errors()->first(),$exception->errors(),10002,$exception->status);
            } elseif ($exception instanceof ModelNotFoundException) {
                return $this->fail("一不小心数据走丢了～～～",[],10003,500);
            } else if ($exception instanceof NotFoundHttpException) {
                return $this->fail('路由未找到',[],10004,$exception->getStatusCode());
            } else if ($exception instanceof MethodNotAllowedHttpException) {
                return $this->fail('请求方法不存在',[],10005,$exception->getStatusCode());
            } else if ($exception instanceof UnauthorizedHttpException) { //这个在jwt.auth 中间件中抛出
                return $this->fail('无效的访问令牌',null,10006,401);
            } elseif ($exception instanceof AuthenticationException) { //这个异常在 auth:api 中间件中抛出
                return $this->fail('无效的访问令牌',null,10006,401);
            } elseif ($exception instanceof \Symfony\Component\HttpKernel\Exception\HttpException &&
                $exception->getStatusCode() == 403){
                return $this->fail('没有访问权限，请联系管理员',null,10007,$exception->getStatusCode());
            }
            return $this->fail($exception->getMessage().' '.$exception->getFile(). ' '.$exception->getLine(),null,10001);
        }else{
            return parent::render($request, $exception);
        }
    }


}
