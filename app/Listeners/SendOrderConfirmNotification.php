<?php

namespace App\Listeners;

use App\Events\OrderConfirmed;
use App\Mail\OrderNotification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Mail;

class SendOrderConfirmNotification
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  object  $event
     * @return void
     */
    public function handle(OrderConfirmed $event)
    {
        Mail::to($event->order->user()->email)->send(new OrderNotification($event->order));
    }
}
