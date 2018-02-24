FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install software-properties-common python-software-properties -y

RUN apt-get install wget curl -y

RUN add-apt-repository ppa:jonathonf/python-3.6
RUN apt-get update
RUN apt-get install python3.6 -y
RUN apt-get install python3-pip -y
RUN python3.6 -m pip install --upgrade pip

RUN apt-get install vim -y

RUN useradd -ms /bin/bash appuser

USER appuser

COPY --chown=appuser . /home/appuser

WORKDIR /home/appuser

RUN python3.6 -m pip install --user --requirement /home/appuser/requirements.txt

ENTRYPOINT ["/bin/bash", "/home/appuser/entrypoint.sh"]
CMD ["10"]