FROM python:3.11

# Location relative to the root 
WORKDIR /app

# Copy our source files to the mount path
COPY ./src /app

CMD ["python3", "demo.py"]