## Podman v4 (v4.3.1)

### OS

- Debian 12.9 (MX 23.5)

### Install


- `uidmap` `slirp4netns` - https://forum.armbian.com/topic/29244-podman-rootless-fails-with-newuidmap-executable-file-not-found-in-path/
    - https://github.com/containers/podman/issues/2211
 

```sh
sudo apt update

sudo apt install podman
sudo apt install uidmap 
sudo apt install slirp4netns
```

- https://github.com/containers/buildah/issues/3726

```sh
sudo mount --make-shared /
```

### Hello

```sh
podman pull hello-world
podman run hello-world

podman image ls
```
