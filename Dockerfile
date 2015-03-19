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

RUN yum install -y wget && \
    wget --no-cookies --header "Cookie: gpw_e24=xxx; oraclelicense=accept-securebackup-cookie;" http://download.oracle.com/otn-pub/java/jdk/8u40-b26/jdk-8u40-linux-x64.rpm && \
    yum install -y jdk-8u40-linux-x64.rpm && \
    yum erase -y wget && \
    rm -rf jdk-8u40-linux-x64.rpm && \
    java -version

# Define default command.
CMD ["bash"]
