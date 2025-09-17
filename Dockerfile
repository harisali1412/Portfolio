# Example: Flutter web build container
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y curl git unzip xz-utils zip libglu1-mesa

# Install Flutter SDK
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Run flutter doctor to download binaries
RUN flutter doctor

# Set working directory
WORKDIR /app

# Copy project
COPY . .

# Build (example for web, change for android/ios)
RUN flutter build web

# Expose port
EXPOSE 8080

CMD ["flutter", "run", "-d", "web-server", "--web-port=8080"]
