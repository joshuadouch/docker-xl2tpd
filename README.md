# docker-xl2tpd
Using xl2tpd in a Docker container to connect to the Andrew &amp; Arnolds L2TP service. Currently running this on VyOS due to the lack of a native L2TP client.
## How to use

I'm using `podman` since this is running on VyOS, but you can substitute with `docker` if neccesary. VyOS lacks the functionality to run containers with the `--privileged` flag natively, hence why this isn't being managed in configuration.

```git clone https://github.com/joshuadouch/docker-xl2tpd.git```

```cd docker-xl2tpd```

Update the `options` file with your username and password, and if not using the A&A L2TP service, edit the `xl2tpd.conf` file with the correct endpoint.

```sudo podman build --network=host -t xl2tpd .```

Run the following command to start the container and read the output for any error messages

```sudo podman run --privileged --network=host --name xl2tpd xl2tpd```

If you need to restart the container to further troubleshoot any error messages, you can either omit the `--name` flag or run with the `--replace` flag

If all good, start the container

```sudo podman start xl2tpd```
