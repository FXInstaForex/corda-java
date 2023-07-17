FROM gradle:latest AS TEMP_BUILD_IMAGE
RUN mkdir -p /usr/app/
ENV APP_HOME=/usr/app/
WORKDIR $APP_HOME
COPY build.gradle settings.gradle $APP_HOME
  
COPY gradle $APP_HOME/gradle
COPY --chown=gradle:gradle . /home/gradle/src
USER root
RUN chown -R gradle /home/gradle/src
    
RUN gradle build || return 0
COPY . .
RUN gradle clean build

FROM openjdk:latest
ENV ARTIFACT_NAME=corda.jar
ENV APP_HOME=/usr/app/PartyA/
WORKDIR $APP_HOME
COPY --from=TEMP_BUILD_IMAGE $APP_HOME/build/libs/$ARTIFACT_NAME .
