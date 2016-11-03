FROM java:8

MAINTAINER delivery-engineering@netflix.com

ENV REDIS_HOST redis
ENV REDIS_PORT 6379

COPY . workdir/

WORKDIR workdir

RUN GRADLE_USER_HOME=cache ./gradlew buildDeb -x test

RUN dpkg -i ./front50-web/build/distributions/*.deb

CMD ["/opt/front50/bin/front50"]
