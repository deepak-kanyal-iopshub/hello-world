# Dockerfile
FROM openjdk:8

# Copy the JAR file into the container
COPY sample.jar /app/sample.jar

# Set the working directory
WORKDIR /app

# Command to run the application
CMD ["java", "-jar", "sample.jar"]
