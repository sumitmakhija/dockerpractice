# Step 1: Use a base Python image
FROM python:3.13-slim

# Step 2: Set the working directory
WORKDIR /app

# Step 3: Install system dependencies
RUN apt-get update \
    && apt-get install -y libpq-dev gcc \
    && apt-get clean

# Step 4: Install Python dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Copy your Django project files to the container
COPY . /app/

# Step 6: Expose port 8000 (the default port for Django dev server)
EXPOSE 8000

# Step 7: Run the Django application (you can change this to gunicorn or another server later)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
