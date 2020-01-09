FROM  ubuntu:bionic

ENV folly_version v2020.01.06.00

WORKDIR /external/src

ADD setup.sh /setup.sh
RUN chmod +x /setup.sh

RUN /setup.sh ${folly_version}

CMD ["/bin/bash"]

