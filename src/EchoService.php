<?php

namespace App;
/**
 * Sample GRPC PHP server.
 */

use Spiral\RoadRunner\GRPC\ContextInterface;
use App\Generated\Grpc\EchoInterface;
use App\Generated\Grpc\Message;

class EchoService implements EchoInterface
{
    public function Ping(ContextInterface $ctx, Message $in): Message
    {
        $out = new Message();

        return $out->setMsg(date('Y-m-d H:i:s').': PONG');
    }
}
