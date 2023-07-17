ARG BUILD_HOME=/corda-java

#
# Gradle image for the build stage.
#
FROM gradle:latest as build-image

#
# Set the working directory.
#
ARG BUILD_HOME
ENV APP_HOME=$BUILD_HOME
WORKDIR $APP_HOME

#
# Copy the Gradle config, source code, and static analysis config
# into the build container.
#
COPY --chown=gradle:gradle build.gradle settings.gradle $APP_HOME/
COPY --chown=gradle:gradle contracts $APP_HOME/contracts
COPY --chown=gradle:gradle workflows $APP_HOME/workflows
COPY --chown=gradle:gradle gradle $APP_HOME/gradle
COPY --chown=gradle:gradle config $APP_HOME/config
COPY --chown=gradle:gradle *.* $APP_HOME/

#
# Build the application.
#
RUN gradle --no-daemon build
