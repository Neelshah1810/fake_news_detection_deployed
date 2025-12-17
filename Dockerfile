# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Install any needed packages specified in requirements.txt
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . .

# Expose the port your app runs on
# Hugging Face Spaces will map this to the appropriate external port
EXPOSE 7860

# Define environment variable for Gunicorn port if needed, though Spaces typically handles this.
ENV PORT 7860

# Run the application using Gunicorn
# Ensure 'app:app' points to your Flask application instance named 'app'
# and use the gunicorn_config.py for configuration
CMD ["gunicorn", "-c", "gunicorn_config.py", "app:app", "-b", "0.0.0.0:7860"]
