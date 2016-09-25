FROM codenvy/ubuntu_jre
RUN apt-get update && \
    apt-get install -y apt-transport-https && \
    # Get the Google Linux package signing key. && \
    sh -c 'curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    # Set up the location of the stable repository. \
    sh -c 'curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list \
        > /etc/apt/sources.list.d/dart_stable.list' && \
    apt-get update && apt-get install -y dart
