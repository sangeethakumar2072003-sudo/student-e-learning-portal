FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# Install dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Ensure uploads directory exists (optional; created at runtime by app as well)
RUN mkdir -p /app/uploads

EXPOSE 5000

# Use the bundled app entrypoint
CMD ["python", "app.py"]
