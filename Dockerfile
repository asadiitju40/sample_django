# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory inside the container
WORKDIR /app

# Copy your Django project files into the container
COPY . /app/

# Install project dependencies from requirements.txt
RUN pip install -r requirements.txt

# Expose the port that your Django app will run on
EXPOSE 8000

# Define the command to start your Django application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

