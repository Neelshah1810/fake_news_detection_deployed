bind = "0.0.0.0:" + str(os.environ.get("PORT", 5000))
workers = 1 # Consider increasing this for higher concurrency, but monitor memory usage.
threads = 2 # Number of threads per worker.
timeout = 120 # Gunicorn worker timeout in seconds. Adjust based on your model's prediction time.

# Logging
accesslog = "-" # Log to stdout
errorlog = "-" # Log to stderr
loglevel = "info" # debug, info, warning, error, critical
