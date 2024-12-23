# Sync time
timedatectl set-ntp on
timedatectl set-timezone UTC

# Start the application
gunicorn app:app --bind 0.0.0.0:8080
