# ===========================================
# Napstar Landing Page
# Optimized for deplo.io deployment
# ===========================================

# Stage 1: Build (if we had a build step)
# For a static site, we skip straight to production

# Stage 2: Production
FROM nginx:alpine

# Remove default nginx config
RUN rm /etc/nginx/conf.d/default.conf

# Copy custom nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy static files
COPY index.html /usr/share/nginx/html/
COPY styles.css /usr/share/nginx/html/

# Copy assets if they exist (favicon, og-image, etc.)
# COPY assets/ /usr/share/nginx/html/assets/

# Create a simple health check file
RUN echo "OK" > /usr/share/nginx/html/health.txt

# deplo.io requirement: Listen on PORT (default 8080)
# nginx.conf is configured to listen on 8080

# Expose port (documentation only, deplo.io uses PORT env var)
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:8080/health || exit 1

# Start nginx in foreground (required for container)
CMD ["nginx", "-g", "daemon off;"]
