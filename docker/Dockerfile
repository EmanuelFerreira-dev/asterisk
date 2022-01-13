FROM ubuntu

RUN apt-get update && apt-get upgrade -y

RUN DEBIAN_FRONTEND="noninteractive" TZ="America/Buenos_Aires" apt-get install -y tzdata

RUN apt install wget build-essential git autoconf subversion pkg-config libtool -y

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install libvpb1

COPY script_base.sh /usr/src/script_base.sh

RUN chmod 777 /usr/src/script_base.sh

RUN bash -c "/usr/src/script_base.sh"

COPY docker-entrypoint.sh /usr/src/docker-entrypoint.sh

RUN chmod 777 /usr/src/docker-entrypoint.sh

ENTRYPOINT ["/usr/src/docker-entrypoint.sh"]
