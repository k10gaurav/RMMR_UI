# Use a base image with Java and Tomcat pre-installed
FROM tomcat:9-jdk11-temurin-focal

# Copy the WAR file into the webapps directory of Tomcat
COPY rmmr-ui/ /usr/local/tomcat/webapps/rmmr-ui

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat when the container starts
CMD ["catalina.sh", "run"]
