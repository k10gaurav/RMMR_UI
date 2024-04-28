# Use a base image with Java and Tomcat pre-installed
FROM tomcat:9-jdk11-temurin-focal

ARG USER=wso2
ARG USER_ID=10001
ARG USER_GROUP=wso2
ARG USER_GROUP_ID=10001
ARG USER_HOME=/usr/local/tomcat/

# create a user group and a user
RUN  addgroup -g ${USER_GROUP_ID} ${USER_GROUP}; \
     adduser -u ${USER_ID} -D -g '' -h ${USER_HOME} -G ${USER_GROUP} ${USER} ;


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

# set the user and work directory
USER ${USER_ID}

# Start Tomcat when the container starts
CMD ["catalina.sh", "run"]
