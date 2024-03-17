FROM python:3.9.18-slim-bullseye

WORKDIR /app

COPY ./ /app/

RUN apt-get update && \
    apt-get install -y gcc && \
    pip install --no-cache-dir -r requirements.txt

ENV TELEGRAM_BOT_API_KEY="6738564444:AAGxxKvzsvBZfziWp-9ffGQAafULYC22n4E"
ENV GEMINI_API_KEYS="AIzaSyDbLitZUUL4MznVhulWOr8cOyOvuZCr2Y8"

CMD flask run -h 0.0.0.0 -p 10000 & python main.py ${TELEGRAM_BOT_API_KEY} ${GEMINI_API_KEYS}
