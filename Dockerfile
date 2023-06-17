# Use an official Python runtime as the base image
FROM ubuntu

# Set the working directory in the container
WORKDIR /app

RUN set -xe \
    && apt-get update \
    && apt-get install python3-pip
    
# Copy the requirements file to the working directory
COPY requirements.txt .

# Install the dependencies
RUN pip install -r requirements.txt

# Copy the entire repository to the working directory
COPY . .

RUN cd bark && pip install .

# Expose the port on which your API will run
#EXPOSE 8000

# Define the command to start the API
# CMD ["python", "app.py"]
