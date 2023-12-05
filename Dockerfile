# Use the official Python image as the base image
FROM python:3.9

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the application files to the container
COPY app.py .

# Install Flask
RUN pip install Flask

# Expose port 2000 for web traffic
EXPOSE 2000

# Define the command to run the application
CMD ["python", "app.py"]

