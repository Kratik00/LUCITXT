FROM python:3.9.7-slim-buster


WORKDIR .
RUN apt -qq update && apt -qq install -y git wget pv jq python3-dev ffmpeg mediainfo
RUN apt-get install -y ntp
COPY . .
RUN pip3 install -r requirements.txt
RUN apt install ffmpeg
sudo timedatectl set-ntp on
sudo timedatectl set-timezone UTC


CMD gunicorn app:app & python3 main.py
RUN apt-get install -y ntp
