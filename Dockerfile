FROM python:3.8-slim

ENV POETRY_VIRTUALENVS_CREATE=False


RUN apt-get update && apt-get install -y --no-install-recommends \
	curl

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py \
| python -

ENV PATH="${PATH}:/root/.poetry/bin"

COPY poetry.lock pyproject.toml /app/

WORKDIR /app

#RUN pip install -r requirements.txt
RUN poetry export --without-hashes -f requirements.txt 	\
                |  poetry run pip install -r /dev/stdin \
		&& poetry debug

RUN pip install gunicorn

COPY . /app
