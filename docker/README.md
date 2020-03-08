# OpenVINO/speechstamp
This folder contains an OpenVINO installation (based on the [official documentation](https://docs.openvinotoolkit.org/latest/_docs_install_guides_installing_openvino_docker_linux.html)), with all requirements installed to run this project.


## Note:
To successful build this container, you need first to build my OpenVINO docker image (*openvino:2020.1*), available on [dockerfiles repository](https://github.com/mdkcore0/dockerfiles).

Just clone the repository, and run the following:
```
dockerfiles $ ./openvino/build.sh
```

## Building:
```
speechstamp/docker $ ./build.sh
```

## Running:
```
speechstamp/docker $ ./run.sh
```
The issued command will put you inside the container, on the `/opt/src` directory, that is a bind-mount volume from the current host directory, and set *userid*/*groupid* to match the host current user too.

This allow you to run the actual code and any output generated will be available on your current directory.

**NOTE**: This container runs using the `openvino` user, that maps to your actual user on your host machine.

**NOTE2**: As "normal" user you can not perform `root` operations, but can use `sudo` and install any package in need as the `root` user (password: **openvino**), but keep on mind that any system modification (i.e., any modification outside `/opt/src`) will be lost once exiting the container, as they are disposable (there are ways on keep a container running, but it is out of scope here :grin:).
