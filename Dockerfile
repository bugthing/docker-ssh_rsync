FROM base/archlinux
RUN pacman --noconfirm -Sy archlinux-keyring \
    && pacman-key --populate \
    && pacman-key --refresh-keys \
    && pacman --noconfirm -Syyuu \
    && pacman-db-upgrade
RUN pacman -S --noconfirm --quiet openssl openssh rsync
RUN /usr/bin/useradd --home-dir /storage -g users -s /bin/bash user
RUN /usr/bin/ssh-keygen -A
RUN echo 'root:roottoor' | chpasswd
RUN echo 'user:userresu' | chpasswd
ADD ./files/sshd_config /etc/ssh/sshd_config
EXPOSE 22
VOLUME ["/storage"]
CMD /usr/bin/sshd -D -f /etc/ssh/sshd_config
