FROM gradle:latest AS BUILD
RUN gradle init
RUN gradle build

RUN mkdir -p /usr/app
