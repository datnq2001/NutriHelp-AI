# Dockerfile

FROM python:3.11-slim

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy only requirements first to leverage Docker cache
COPY requirements.deploy.txt .

# Install Python dependencies
RUN pip install --upgrade pip && pip install -r requirements.deploy.txt

# Copy app code and runtime assets last (this is what changes most often)
COPY nutrihelp_ai/ ./nutrihelp_ai/
COPY models/ ./models/
COPY run.py ./run.py

# Expose port
EXPOSE 8000

# Run the app
CMD ["python", "run.py"]
