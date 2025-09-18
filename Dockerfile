# Build stage with Flutter 3.19.0 (Dart 3.1+)
FROM ghcr.io/cirruslabs/flutter:3.24.5 as build

WORKDIR /app
COPY . .

# Fetch dependencies and build
RUN flutter pub get
RUN flutter build web --release --web-renderer html

# Production stage with Nginx
FROM nginx:alpine
COPY --from=build /app/build/web /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
