FROM python:3.12-slim
ENV PYTHONUNBUFFERED 1

WORKDIR /webapps

#RUN apt-get update && apt-get install \
#  -y --no-install-recommends apt-utils \
#  python-dev python3-dev \
#  build-essential libssl-dev libffi-dev \
#  libxml2-dev libxslt1-dev zlib1g-dev

COPY . /webapps/

RUN pip install -U pip setuptools
RUN python -m pip install --upgrade pip poetry==1.6.1
RUN poetry config virtualenvs.create false
RUN pip install --no-cache-dir poetry
RUN poetry install
