FROM python:3.8-slim
RUN mkdir /code
WORKDIR /code

COPY requirements.txt /code/
RUN pip install -r requirements.txt --no-cache-dir
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6 wget  -y
COPY . /code/
ENV PYTHONUNBUFFERED=1
CMD [ "python", "./main.py" ]
