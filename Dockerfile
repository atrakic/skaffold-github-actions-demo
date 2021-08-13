FROM tiangolo/uwsgi-nginx-flask:python3.8-alpine
WORKDIR /app

COPY requirements.txt requirements.txt
RUN python -m pip install --upgrade pip && pip3 install -r requirements.txt

COPY . .
