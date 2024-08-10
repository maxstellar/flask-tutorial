FROM python:alpine
WORKDIR /main
COPY flaskr flaskr
COPY gunicorn.conf.py gunicorn.conf.py
COPY requirements.txt requirements.txt
RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt
RUN flask --app flaskr init-db

ENTRYPOINT ["gunicorn"]