docker container run \
        -it \
        --rm \
        --userns=keep-id \
        -w /build-bionic \
        -v "`pwd`:/build-bionic:Z"  \
        --user "$(id -u):$(id -g)" \
        nova-tox-train /bin/bash

