# Docker files for unit test envs of older OpenStack branches

## Docker

One time setup:
* install docker
* make sure that your normal user can run containers with docker. E.g on debian add your user to the "docker" group
* build container images with ``build-<branch>.sh``

Usage:
* At the root of the OpenStack git repo run ``docker-tox-<branch>.sh``
* Now you can run ``tox``

## Podman

On Fedora (or other systems using podman), install the ``podman-docker`` package
to provide a transparent ``docker`` CLI compatibility layer. This allows the
existing ``build-<branch>.sh`` scripts to work unmodified since they call
``docker build`` internally, which is redirected to podman.

```bash
sudo dnf install podman-docker
```

One time setup:
* build container images with ``build-<branch>.sh``

Usage:
* At the root of the OpenStack git repo run ``docker-tox-<branch>.sh`` to get
  an interactive shell, then run ``tox`` inside the container.

Alternatively, you can run tox directly without an interactive shell. For older
branches (e.g. queens), you may need to override the constraints URL since the
original ``git.openstack.org`` URLs no longer resolve:

```bash
podman container run \
    --rm \
    --userns=keep-id \
    -w /build-xenial \
    -v "$(pwd):/build-xenial:Z" \
    --user "$(id -u):$(id -g)" \
    -e "UPPER_CONSTRAINTS_FILE=https://opendev.org/openstack/requirements/raw/tag/queens-eol/upper-constraints.txt" \
    nova-tox-queens \
    tox -e py27 -- nova.tests.unit.compute.test_compute_api.ComputeAPIUnitTestCase.test_create_strips_internal_scheduler_hints
```
