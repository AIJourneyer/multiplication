# Start from Google Cloud Functions base image for Python
FROM gcr.io/google.com/cloudsdktool/cloud-sdk:slim

# Install Python and pip
RUN apt-get update && apt-get install -y python3 python3-pip && \
    ln -s /usr/bin/python3 /usr/bin/python

# Set workdir
WORKDIR /app

# Copy files
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY main.py .

# Tell Cloud Functions where the entry point is
ENV FUNCTION_TARGET=multiply_arrays
ENV FUNCTION_SIGNATURE_TYPE=http
ENV PORT=8080

# Use Functions Framework to launch the function
RUN pip install functions-framework
CMD ["functions-framework", "--target=multiply_arrays"]
