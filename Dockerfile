#Build stage
FROM gradle:latest AS BUILD
RUN gradle build

FROM openjdk:latest
ENV ARTIFACT_NAME=corda.jar
RUN mkdir -p ./PartyA
COPY --from=BUILD ./build/libs/$ARTIFACT_NAME ./PartyA/
