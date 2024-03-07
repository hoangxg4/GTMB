FROM python:3.9.18-slim-bullseye

WORKDIR /app

COPY ./ /app/

RUN apt-get update && \
    apt-get install -y gcc && \
    pip install --no-cache-dir -r requirements.txt

ENV TELEGRAM_BOT_API_KEY="6896549861:AAGxHHQV608MzzANxTdlN4eEiWyzuHx4DV8"
ENV GEMINI_API_KEYS="AIzaSyDbLitZUUL4MznVhulWOr8cOyOvuZCr2Y8"

CMD ["sh", "-c", "python main.py ${TELEGRAM_BOT_API_KEY} ${GEMINI_API_KEYS}"]
