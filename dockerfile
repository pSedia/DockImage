#base image
FROM ubuntu:18.04
RUN apt-get update && apt-get upgrade -y
RUN apt-get install openjdk-8-jre -y
RUN apt-get install git -y


RUN apt-get install -y git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib x11proto-core-dev libx11-dev libgl1-mesa-dev libxml2-utils xsltproc unzip python python3 openjdk-8-jdk rsync

RUN python --version

RUN mkdir -p ~/.bin && PATH="${HOME}/.bin:${PATH}" && curl https://storage.googleapis.com/git-repo-downloads/repo > ~/.bin/repo && chmod a+rx ~/.bin/repo && ls -a && git config --global user.name francescop && git config --global user.email francesco@yahoo.it && repo init -u https://github.com/android-rpi/kernel_manifest -b arpi-5.10 && repo sync

RUN build/build.sh






