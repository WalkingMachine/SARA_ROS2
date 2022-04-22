FROM osrf/ros:foxy-desktop

RUN mkdir -p ~/dev/src

WORKDIR /root/dev

RUN apt-get update
RUN apt-get install python3-pip -y

# Base Python dependencies
# Documentation builder
RUN pip install sphinx
# Auto correct python files with pep 8
RUN pip install autopep8

RUN sed -i "$ d" /ros_entrypoint.sh
RUN echo 'source "/root/dev/install/setup.bash"' >> /ros_entrypoint.sh
RUN echo 'exec "$@"' >> /ros_entrypoint.sh

ENTRYPOINT [ "/ros_entrypoint.sh" ]