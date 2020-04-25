FROM cm2network/steamcmd:latest

LABEL maintainer="eric vz <docker@base10.org>"

ENV SERVER_DIRECTORY=/home/steam/avorion
ENV OVERWRITE_DIRECTORY=/opt/server-overwrite

# Create server dir
RUN mkdir -p ${SERVER_DIRECTORY}
COPY --chown=steam start.sh ${SERVER_DIRECTORY}/start.sh
RUN chmod +x ${SERVER_DIRECTORY}/start.sh

# Create volume for server config
VOLUME /home/steam/.avorion/galaxies/avorion_galaxy

# Ports required
EXPOSE 27000
EXPOSE 27000/udp
EXPOSE 27003
EXPOSE 27003/udp
EXPOSE 27020
EXPOSE 27021

# Admin steamID
ENV USER=nobody

CMD ["/home/steam/avorion/start.sh"]
