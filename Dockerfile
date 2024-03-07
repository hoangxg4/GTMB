# Stage 1: Xây dựng ứng dụng
FROM python:3.9.18-slim-bullseye AS builder

WORKDIR /app

COPY ./ /app/

RUN apt-get update && \
    apt-get install -y gcc && \
    pip install --no-cache-dir -r requirements.txt && \
    docker build -t gemini_tg_bot .

# Stage 2: Chạy ứng dụng
FROM python:3.9.18-slim-bullseye

WORKDIR /app

# Sao chép ứng dụng đã được xây dựng từ Stage 1
COPY --from=builder /app /app

# Thiết lập biến môi trường
ENV TELEGRAM_BOT_API_KEY="6896549861:AAGxHHQV608MzzANxTdlN4eEiWyzuHx4DV8"
ENV GEMINI_API_KEYS="AIzaSyDbLitZUUL4MznVhulWOr8cOyOvuZCr2Y8"

# Chạy ứng dụng
CMD ["sh", "-c", "docker run -d --restart=always -e TELEGRAM_BOT_API_KEY=$TELEGRAM_BOT_API_KEY -e GEMINI_API_KEYS=$GEMINI_API_KEYS gemini_tg_bot"]
