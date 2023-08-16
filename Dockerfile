# Use the official Django image from DockerHub as the base
FROM python:3.9-slim
# Set environment variables
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
# Create and set the working directory
WORKDIR /app
# Install Python dependencies
COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install -r requirements.txt
# Copy the Django project to the container
COPY . /app/
WORKDIR /app
RUN python ./manage.py migrate
CMD python manage.py runserver 0.0.0.0:8080
