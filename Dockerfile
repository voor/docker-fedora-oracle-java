# Copyright 2015 Robert Van Voorhees
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM fedora:latest

# From https://github.com/tifayuki/docker-image-java/blob/master/7/Dockerfile
# Which was found from https://github.com/Netflix-Skunkworks/zerotodocker
# Then modified for a Fedora environment rather than Ubuntu
# Then further modified from https://github.com/dockerfile/java/blob/master/openjdk-6-jdk/Dockerfile

# Install Oracle Java 8
ENV JAVA_VER 8
ENV JAVA_HOME /usr/java/latest
# Change me every time Java is updated.
ENV JAVA_RPM jdk-8u66-linux-x64.rpm
ENV JAVA_RPM_URL http://download.oracle.com/otn-pub/java/jdk/8u66-b17/$JAVA_RPM
# Get the necessary hash, for example: https://www.oracle.com/webfolder/s/digest/8u66checksum.html
ENV JAVA_HASH 159cf0b31396458e342835b57afa4b61

## You must accept the Oracle Binary Code License Agreement for Java SE to download this software.
## Read more here: http://www.oracle.com/technetwork/java/javase/terms/license/index.html
## Based off the github gist: https://gist.github.com/voor/b2dd473db296d9eae004
RUN curl -L -H "Cookie: gpw_e24=xxx; oraclelicense=accept-securebackup-cookie;" $JAVA_RPM_URL -o /tmp/$JAVA_RPM && \
    printf "$JAVA_HASH /tmp/$JAVA_RPM" | md5sum -c && \
    dnf install -y /tmp/$JAVA_RPM && \
    rm -rf /tmp/$JAVA_RPM && \
    java -version

# Define default command.
CMD ["bash"]
