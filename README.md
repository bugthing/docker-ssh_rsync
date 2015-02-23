# docker-ssh_rsync

Docker image for ssh &amp; rsync capibal container.

Intended for syncing file .. throw it up and sync against it.

## The `user` User

There is one user within the container, named `user`.

This User is meant to be able to log into this container and rsync via ssh

Mount a volume containing the public key and you can authenticate as user `user` (the only user on the system)

    cat ~/.ssh/id_rsa.pub > /storage/ssh-vol/user_authorized_keys

## Run the container

    docker run -d -t --name=ssh -p 22:22 -v /storage/ssh-vol:/storage bugthing/docker-ssh_rsync
