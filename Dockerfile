#Build stage
FROM gradle:latest AS BUILD
WORKDIR /usr/app/
COPY . . 
RUN gradle build

FROM openjdk:latest
ENV ARTIFACT_NAME=corda.jar
RUN mkdir -p /usr/app/PartyA
ENV APP_HOME=/usr/app/PartyA/
WORKDIR $APP_HOME
COPY --from=TEMP_BUILD_IMAGE $APP_HOME/build/libs/$ARTIFACT_NAME .
