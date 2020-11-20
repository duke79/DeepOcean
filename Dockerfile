FROM frolvlad/alpine-python3

COPY . /code

WORKDIR /code

RUN python -m pip install -r requirements.txt
RUN python app.py
