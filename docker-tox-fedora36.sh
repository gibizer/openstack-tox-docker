docker container run \
        -it \
        --rm \
        --userns=keep-id \
        -w /fedora36 \
        -v "`pwd`:/fedora36:Z"  \
        --user "$(id -u):$(id -g)" \
        nova-tox-fedora36:latest /bin/bash

