FROM ubuntu:latest
RUN mkdir -p /usr/app/PartyA

#Build stage
FROM gradle:latest AS BUILD
RUN gradle init
WORKDIR /usr/app/
COPY . . 
RUN gradle build

