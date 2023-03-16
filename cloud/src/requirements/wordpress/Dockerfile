FROM debian:11.6

WORKDIR /home
COPY ./tools/install_wp.sh .
RUN chmod +x install_wp.sh

EXPOSE 9000
CMD ["./install_wp.sh"]