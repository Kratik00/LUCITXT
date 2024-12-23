FROM python:3.9.7-slim-buster


WORKDIR .
RUN apt -qq update && apt -qq install -y git wget pv jq python3-dev aria2 musl-dev libffi-dev ffmpeg mediainfo
    && rm -rf /var/lib/apt/lists/*
COPY . .
RUN pip3 install --no-cache-dir --upgrade --requirement requirements.txt

CMD gunicorn app:app & python3 main.py
