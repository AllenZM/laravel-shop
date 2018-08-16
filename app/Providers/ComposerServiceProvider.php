<?php

namespace App\Providers;

use Illuminate\Http\Request;
use Illuminate\Support\ServiceProvider;

class ComposerServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap services.
     * @param Request $request
     *
     * @return void
     */
    public function boot(Request $request)
    {
        view()->composer('layouts._footer', function ($view) use ($request) {
            $location = geoip($request->ip());
            $view->with('location', $location->country . ' - ' . $location->state_name . ' - ' . $location->city);
        });
    }

    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
