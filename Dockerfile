FROM python:3.6-alpine

LABEL maintainer="PHD <phd59fr@gmail.com>"

RUN apk --update add python py-pip openssl ca-certificates py-openssl wget

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY ./API/* /usr/src/app/
COPY ./requirements.txt /usr/src/app/

RUN apk --update add --virtual build-dependencies libffi-dev openssl-dev python-dev py-pip build-base && \
    pip install --upgrade pip && \
    pip install falcon supervisor-stdout gunicorn

ONBUILD RUN pip install -r /usr/src/app/requirements.txt && \
    apk del build-dependencies

RUN rm /usr/src/app/requirements.txt

EXPOSE 8000

CMD ["gunicorn", "-w 4", "api:api"]
