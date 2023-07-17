FROM gradle:latest AS BUILD
RUN gradle init
RUN gradle build

RUN mkdir -p /var/www/new_directory
