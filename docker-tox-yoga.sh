docker container run \
        -it \
        --rm \
        --userns=keep-id \
        -w /build-jammy \
        -v "`pwd`:/build-jammy:Z" \
        --user "$(id -u):$(id -g)" \
        nova-tox-yoga /bin/bash

