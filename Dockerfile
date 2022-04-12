FROM osrf/ros:foxy-desktop

RUN mkdir -p ~/dev/src

WORKDIR /root/dev

RUN sed -i "$ d" /ros_entrypoint.sh
RUN echo 'source "/root/dev/install/setup.bash"' >> /ros_entrypoint.sh
RUN echo 'exec "$@"' >> /ros_entrypoint.sh

ENTRYPOINT [ "/ros_entrypoint.sh" ]