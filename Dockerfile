FROM base/archlinux
RUN pacman -Syy --noconfirm --quiet && pacman -S --noconfirm --quiet openssh rsync
RUN /usr/bin/useradd --home-dir /storage -g users -s /bin/bash user
RUN /usr/bin/ssh-keygen -A
RUN echo 'root:roottoor' | chpasswd
RUN echo 'user:userresu' | chpasswd
ADD ./files/sshd_config /etc/ssh/sshd_config
EXPOSE 22
VOLUME ["/storage"]
CMD /usr/bin/sshd -D -f /etc/ssh/sshd_config
