<?php
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: proto/service.proto

namespace App\Generated\Grpc\GPBMetadata;

class Service
{
    public static $is_initialized = false;

    public static function initOnce() {
        $pool = \Google\Protobuf\Internal\DescriptorPool::getGeneratedPool();

        if (static::$is_initialized == true) {
          return;
        }
        $pool->internalAddGeneratedFile(
            '
�
proto/service.protoservice"
Message
msg (	24
Echo,
Ping.service.Message.service.Message" B6�App\\Generated\\Grpc�App\\Generated\\Grpc\\GPBMetadatabproto3'
        , true);

        static::$is_initialized = true;
    }
}

