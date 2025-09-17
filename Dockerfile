# Use prebuilt Flutter image
FROM ghcr.io/cirruslabs/flutter:latest

# Set workdir
WORKDIR /app

# Copy project files
COPY . .

# Get dependencies
RUN flutter pub get

# Example build (for web)
RUN flutter build web

# Expose port (if web app)
EXPOSE 8080

# Command to run
CMD ["flutter", "run", "-d", "web-server", "--web-port=8080", "--web-hostname=0.0.0.0"]
