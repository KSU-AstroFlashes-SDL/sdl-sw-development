# KSU AstroFlashes SDL Software Team Development Image - Troubleshooring

This document addresses some known issues with Dev Containers and VS Code. If
you are experiencing problems getting the SDL development image to work
properly in VS Code, check the sections below to see if your issue is
addressed.

## Error: database configuration mismatch

If you see output similar to the following on *Linux*:

```console
[16263 ms] Error: database static dir
"/home/mattz/snap/code/249/.local/share/containers/storage/libpod" does
not match our static dir
"/home/mattz/snap/code/259/.local/share/containers/storage/libpod":
database configuration mismatch

[16264 ms] Exit code 125
```

This is the issue caused by a Snap-installed VS Code. Uninstall the Snap
version of VS Code, and then follow the instructions from
[Installing Visual Studio Code on Linux](https://code.visualstudio.com/docs/setup/linux)
to install VS Code from Microsoft's official RPM. Consult your distro's
documentation for specific instructions on how to install software directly
from RPMs.

## Error: no such file or directory

If you see output similar to the following on *Linux*:

```console
[79793 ms] Error: statfs /var/run/docker.sock: no such file or directory
[79793 ms] Exit code 125
```

This can happen if you are running *Podman Desktop* on Linux. Go back to the
[README](README.md) document and make sure you've followed the "Linux-specific
instructions" update the location of the Podman socket file (podman.sock) in
the Dev Containers extension settings.

