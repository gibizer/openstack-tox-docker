podman container run \
        -it \
        --rm \
        --userns=keep-id \
        -w /build-xenial \
        -v "`pwd`:/build-xenial:Z" \
        --user "$(id -u):$(id -g)" \
        nova-tox-queens /bin/bash

