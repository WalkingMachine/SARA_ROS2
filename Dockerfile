FROM osrf/ros:foxy-desktop

RUN mkdir -p ~/dev/src

WORKDIR /root/dev

RUN apt-get update
RUN apt-get install python3-pip -y

# Base Python dependencies
# Documentation builder
RUN pip install sphinx sphinx-rtd-theme
# Auto correct python files with pep 8
RUN pip install autopep8

# Flake8 import is broken, this fixes it
RUN PATH=$PATH:/usr/lib && pip install --force-reinstall flake8

RUN sed -i "$ d" /ros_entrypoint.sh
RUN echo 'source "/root/dev/install/setup.bash"' >> /ros_entrypoint.sh
RUN echo 'exec "$@"' >> /ros_entrypoint.sh

ENTRYPOINT [ "/ros_entrypoint.sh" ]