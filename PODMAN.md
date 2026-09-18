# KSU AstroFlashes SDL Software Team Development Image - Podman instructions

Advanced users (particularly those running Linux) MAY have already installed
`podman` or `Podman Desktop`.

These are *mostly* drop-in replacements for `docker` and `Docker Desktop`,
but additional configuration changes must be made for podman.

```console
systemctl --user status podman.socket
echo "${XDG_RUNTIME_DIR}/podman/podman.sock"
```

Copy the echoed path; you'll need it for the settings changes detailed below.
 
Configure the VS Code *Dev Containers* extension:

1. Click on the gear icon on the "Extensions: Dev Container" info tab to
   open the extension's settings panel.
2. Find the "Dev › Containers: Docker Compose Path" setting and change the
   value to "podman-compose".
3. Find the "Dev › Containers: Docker Path" setting and change the value to
   "podman".
4. Find the "Dev › Containers: Docker Socket Path" setting and change the
   value to the echoed path you copied (above).

Finally, you must edit the *.devcontainer/devcontainer.json* file.

Add a "runArgs" section between "mounts" and "workspaceFolder". Your
*.devcontainer/devcontainer.json* should look like:

```json
  ...
  "mounts": [
    "source=sdl-sw-developer-home,target=/home/developer,type=volume"
  ],
  "runArgs": [
    "--userns=keep-id"
  ],
  "workspaceFolder": "/home/developer",
  ...
```

