# Use an official Python runtime as the base image
FROM ubuntu

# Set the working directory in the container
WORKDIR /app

RUN set -xe \
    && apt-get update -y \
    && apt-get install -y python3-pip
    
# Copy the requirements file to the working directory
COPY requirements.txt .

# Install the dependencies
RUN pip install -r requirements.txt

# Copy the entire repository to the working directory
COPY . .

RUN pip install git+https://github.com/suno-ai/bark.git

# Expose the port on which your API will run
#EXPOSE 8000

# Define the command to start the API
# CMD ["python", "app.py"]
