# Use a base image with Java and Tomcat pre-installed
FROM tomcat:9-jdk11-temurin-focal

# create a user group and a user
RUN  addgroup -g 10014 wso2; \
     adduser -u 10014 -D -g '' -h /usr/local/tomcat/ -G wso2 wso2 ;

# Copy the entire folder into the container
COPY rmmr-ui/ /usr/local/tomcat/webapps/rmmr-ui

# Change ownership of the directory to the non-root user
RUN chown -R ${USER}:${USER_GROUP} /usr/local/tomcat/webapps/rmmr-ui

# Expose the default Tomcat port
EXPOSE 8080

# set the user and work directory
USER 10014

# Start Tomcat when the container starts
CMD ["catalina.sh", "run"]
