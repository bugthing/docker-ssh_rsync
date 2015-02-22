FROM base/archlinux
RUN pacman -Syy && pacman -S --noconfirm --quiet openssh rsync
VOLUME ["/storage"]
ADD ./files/sshd_config /etc/ssh/sshd_config
EXPOSE 22
CMD /usr/bin/ssh-keygen  -f /etc/ssh/ssh_host_rsa_key -t rsa -N '' &&\
    /usr/bin/useradd -m -g users -s /usr/bin/nologin user &&\
    /usr/bin/sshd -D -f /etc/ssh/sshd_config
