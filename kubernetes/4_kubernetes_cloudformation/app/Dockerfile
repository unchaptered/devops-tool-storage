FROM python:3.10

WORKDIR /project

COPY . /project

RUN pip install --upgrade pip; pip install -r requirements.txt

CMD ["python", "./src/app.py"]

EXPOSE 80