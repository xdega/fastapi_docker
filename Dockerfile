# syntax=docker/dockerfile:1

##########################
# 1. BUILDER STAGE
##########################
FROM python:3.9-slim AS builder

WORKDIR /app
COPY requirements.txt .

# Install pip dependencies system-wide
RUN pip install --no-cache-dir -r requirements.txt

##########################
# 2. FINAL STAGE
##########################
FROM python:3.9-slim

WORKDIR /app

# Copy only the necessary system-wide installs
COPY --from=builder /usr/local /usr/local

# Create a non-root user and switch
RUN groupadd -r appgroup && useradd -r -g appgroup appuser
USER appuser

# Copy application code
COPY --chown=appuser:appgroup app/ app/

EXPOSE 8000

# Run Gunicorn + Uvicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app.main:app", "-k", "uvicorn.workers.UvicornWorker"]
