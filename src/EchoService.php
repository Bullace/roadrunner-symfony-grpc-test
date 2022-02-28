<?php
/**
 * Sample GRPC PHP server.
 */

use App\Service\EchoInterface;
use App\Service\Message;
use Spiral\RoadRunner\GRPC\ContextInterface;

class EchoService implements EchoInterface
{
    public function Ping(ContextInterface $ctx, Message $in): Message
    {
        $out = new Message();

        return $out->setMsg(date('Y-m-d H:i:s').': PONG');
    }
}
