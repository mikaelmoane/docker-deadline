FROM ubuntu:latest

# Install dependencies for Deadline
RUN apt -y update && apt -y upgrade

# Copy over the installer.
RUN mkdir /tmp/thinkboxsetup/
COPY installers/DeadlineClient-10.*-linux-x64-installer.run /tmp/thinkboxsetup/

RUN apt -y install bzip2
RUN apt -y install mono-complete

# Run the installer.
RUN /tmp/thinkboxsetup/DeadlineClient-10.*-linux-x64-installer.run \
    --mode unattended \
    --unattendedmodeui none \ 
    --repositorydir /mnt/DeadlineRepository10 \ 
    --noguimode true \ 
    --webservice_httpport 8082 \ 
    --restartstalled true  && \
    rm -rf /tmp/thinkboxsetup

WORKDIR /opt/Thinkbox/Deadline10/bin/