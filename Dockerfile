FROM python:3.8-slim

RUN apt-get update -q \
  && apt-get install --no-install-recommends -qy \
    inetutils-ping \
  && rm -rf /var/lib/apt/lists/*

COPY [ "requirements.txt", "/dashmachine/" ]

WORKDIR /dashmachine

RUN pip install --no-cache-dir --progress-bar off -r requirements.txt

COPY [ ".", "/dashmachine/" ]

ENV PRODUCTION=true
EXPOSE 5000
VOLUME /dashmachine/dashmachine/user_data
CMD [ "gunicorn", "--bind", "[::1]:8000","--bind", "127.0.0.1:80", "wsgi:app" ]
