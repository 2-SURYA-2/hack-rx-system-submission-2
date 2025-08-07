FROM python:3.11-slim

WORKDIR /app

# Create virtual environment
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Default port Render expects
ENV PORT=10000
EXPOSE 10000

CMD ["sh", "-c", "uvicorn api.main:app --host 0.0.0.0 --port $PORT"]
