# Build stage
FROM alpine/flutter:3.19.0 as build
RUN apk add --no-cache bash
WORKDIR /app
COPY . .
RUN flutter pub get
RUN flutter build web --release --web-renderer html

# Production stage
FROM nginx:alpine
COPY --from=build /app/build/web /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
