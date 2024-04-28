# Use a base image with Java and Tomcat pre-installed
FROM tomcat:9-jdk11-temurin-focal

# Create a non-root user with UID and GID between 10000 and 20000
RUN groupadd -g 10009 myuser && \
    useradd -r -u 10009 -g myuser myuser

# Set the working directory
WORKDIR /usr/local/tomcat

# Create a directory in the container to copy the folder into
RUN mkdir -p /usr/local/tomcat/my-webapp

# Copy the entire folder into the container
COPY rmmr-ui/ /usr/local/tomcat/webapps/rmmr-ui

# Change ownership of the directory to the non-root user
RUN chown -R myuser:myuser /usr/local/tomcat/rmmr-ui

# Expose the default Tomcat port
EXPOSE 8080

# Switch to the non-root user
USER myuser

# Start Tomcat when the container starts
CMD ["catalina.sh", "run"]
