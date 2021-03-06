FROM codenvy/ubuntu_jre
RUN sudo apt-get update && \
    sudo apt-get install -y apt-transport-https 
RUN sudo sh -c 'curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
    # Set up the location of the stable repository. \
RUN sudo sh -c 'curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list' 
RUN sudo apt-get update && sudo apt-get install -y dart
    
# Expose ports. All processes running in a Docker container should be access from outside.
EXPOSE 8080

# Run instructions are identical to commands in your local Unix terminal
RUN echo 'export PATH="/usr/lib/dart/bin:${PATH}"' >> /home/user/.bashrc

# Map application port to the IDE client
ENV CODENVY_APP_PORT_8080_HTTP 8080

# CMD instructions actually launch a container.
# Usually processes and services are started in CMD

