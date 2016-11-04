FROM java:8-jre

MAINTAINER delivery-engineering@netflix.com

COPY ./front50-web/build/distributions/*.deb workdir/packages/

WORKDIR workdir

RUN dpkg -i ./packages/*.deb

CMD ["/opt/front50/bin/front50"]
