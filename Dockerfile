# Use the Python 3.8 slim-buster image as the base image
FROM python:3.8-slim-buster

# Update the package list, install AWS CLI, and clean up cache
RUN apt-get update && apt-get install -y --no-install-recommends \
    awscli \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install the dependencies listed in requirements.txt
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Run the app using Python
CMD ["python", "app.py"]
