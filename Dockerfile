FROM python:3.9

ENV PYTHONUNBUFFERED True

COPY requirements.txt ./
RUN set -ex; \
    pip install -r requirements.txt

ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./
# DOCKER prueba
CMD exec gunicorn --bind :$PORT_NUK --workers 1 --threads 8 --timeout 0 main:app
