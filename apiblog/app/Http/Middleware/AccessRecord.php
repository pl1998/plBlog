<?php

namespace App\Http\Middleware;

use App\Jobs\VisitorsToRecordJob;
use Closure;
use Illuminate\Http\Request;

class AccessRecord
{

    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        if($request->route()->uri == 'api/article/{id}' && env('APP_DEBUG') == false){
            VisitorsToRecordJob::dispatch($request->getClientIp(),$request->id);
        }
        return $next($request);
    }
}
