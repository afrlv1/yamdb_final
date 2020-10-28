FROM python:3.8.5

WORKDIR /code
COPY . /code
RUN mkdir /static
RUN pip install -r /code/requirements.txt

RUN python3 manage.py collectstatic --noinput
RUN python3 manage.py makemigrations
RUN python3 manage.py migrate
CMD gunicorn api_yamdb.wsgi:application --bind 0.0.0.0:8000