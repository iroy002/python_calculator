# Stage 1: Build Stage
FROM python:3.9-slim as build

# Set working directory
WORKDIR /app

# Copy the calculator script into the container
COPY calculator.py .

# Install required dependencies (e.g., Flask)
RUN pip install flask

# Stage 2: Production Stage using Distroless Image
FROM FROM python:3.9-slim as production
 
# Set working directory for the final image
WORKDIR /app

# Copy the calculator.py file from the build stage
COPY --from=build /app/calculator.py .

# Set the entrypoint to run the Python calculator script when the container starts
CMD ["calculator.py"]

