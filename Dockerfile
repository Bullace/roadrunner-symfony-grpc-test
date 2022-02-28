ARG RR_VERSION
ARG RR_IMAGE=spiralscout/roadrunner:${RR_VERSION}
ARG PHP_IMAGE_VERSION
ARG PHP_IMAGE=thecodingmachine/php:${PHP_IMAGE_VERSION}

FROM ${RR_IMAGE} as rr

FROM ${PHP_IMAGE}

# Install protoc
RUN sudo apt-get update && sudo apt-get install protobuf-compiler -yqq 

# Copy RoadRunner
COPY --from=rr /usr/bin/rr /usr/bin/rr

# Copy RoadRunner config
COPY --from=rr /etc/rr.yaml /etc/rr.yaml

# CMD ["/usr/bin/rr", "serve", "-d", "-c", "/etc/rr.yaml"]
