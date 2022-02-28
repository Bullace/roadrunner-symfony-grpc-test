ARG RR_VERSION
ARG RR_IMAGE=spiralscout/roadrunner:${RR_VERSION}
ARG PHP_IMAGE_VERSION
ARG PHP_IMAGE=thecodingmachine/php:${PHP_IMAGE_VERSION}

FROM ${RR_IMAGE} as rr

FROM ${PHP_IMAGE}

# Install protoc
RUN sudo apt-get update && sudo apt-get install protobuf-compiler -yqq

# Download protoc-gen-php-grpc
RUN wget https://github.com/roadrunner-server/roadrunner/releases/download/v2.8.2/protoc-gen-php-grpc-2.8.2-linux-amd64.tar.gz
RUN tar -xzf protoc-gen-php-grpc-2.8.2-linux-amd64.tar.gz
RUN sudo mv ./protoc-gen-php-grpc-2.8.2-linux-amd64/protoc-gen-php-grpc /usr/bin/protoc-gen-php-grpc
RUN sudo chmod +x /usr/bin/protoc-gen-php-grpc
RUN rm protoc-gen-php-grpc-2.8.2-linux-amd64.tar.gz
RUN rmdir protoc-gen-php-grpc-2.8.2-linux-amd64

# Copy RoadRunner
COPY --from=rr /usr/bin/rr /usr/bin/rr

# Copy RoadRunner config
COPY --from=rr /etc/rr.yaml /etc/rr.yaml

# CMD ["/usr/bin/rr", "serve", "-d", "-c", "/etc/rr.yaml"]
