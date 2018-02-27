FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install software-properties-common python-software-properties -y \
    && apt-get install wget curl -y \
    && apt-get install vim -y \
    && add-apt-repository ppa:jonathonf/python-3.6 \
    && apt-get update \
    && apt-get install python3.6 -y \
    && apt-get install python3-pip -y \
    && python3.6 -m pip install --upgrade pip \
    && useradd -ms /bin/bash appuser

USER appuser

COPY --chown=appuser . /home/appuser

WORKDIR /home/appuser

RUN python3.6 -m pip install --user --requirement /home/appuser/requirements.txt

ENTRYPOINT ["/bin/bash", "/home/appuser/entrypoint.sh"]
CMD ["10"]