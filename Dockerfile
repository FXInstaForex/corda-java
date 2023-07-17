#Build stage
FROM gradle:latest AS BUILD
RUN mkdir -p /usr/app/PartyA
RUN gradle init
WORKDIR /usr/app/
COPY . . 
RUN gradle build

