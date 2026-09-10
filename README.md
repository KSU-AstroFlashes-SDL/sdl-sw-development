# KSU AstroFlashes SDL Software Team Development Image

This is a collection of assets used to create the SDL Software Team
development image, currently based on
[Ubuntu 26.04 LTS](https://documentation.ubuntu.com/release-notes/26.04/summary-for-lts-users/).

This project is based on the concept of
[Deveopment Containers](https://containers.dev/).
Care has been taken to streamline the SDL developer experience but some edge
cases are inevitable.  If you encounter any issues, the first place to look is
this repository's [Troubleshooting](TROUBLESHOOTING.md) document.

> [!NOTE]
> This project (specifically, the image created by it) replaces the
> [KSU-AstroFlashes-SDL/sdl-sw-bootstrap](https://github.com/KSU-AstroFlashes-SDL/sdl-sw-bootstrap)
> project, which is no longer supported/maintained.
>
> As of the Fall 2026 semester, Software Team members **SHOULD** use this new
> development image instead of WSL (Windows Subsystem for Linux) and the
> now-deprecated *KSU-AstroFlashes-SDL/sdl-sw-bootstrap/wsl-ubuntu-bootstrap*
> script.  Team members **MAY** uninstall the Ubuntu image to reclaim some disk
> space.

> [!CAUTION]
> WSL itself should **not** be uninstalled. It is used by both `Podman Desktop`
> and `Docker Desktop` (discussed below) to improve performance on Windows.

## Prerequisites

1. **Windows users:** Install the
   [Windows Subsystem for Linux (WSL)](https://learn.microsoft.com/en-us/windows/wsl/install).
   This is used internally by Podman Desktop or Docker Desktop to improve
   performace on Windows machines.

   > [!NOTE]
   > It is not necessary to install any Linux distro in WSL.
2. Install *either* [Podman Desktop](https://podman-desktop.io/) *or*
   [Docker Desktop](https://www.docker.com/products/docker-desktop/). This
   allows the VS Code IDE to run the development image.
3. Install the [Microsoft VS Code](https://code.visualstudio.com/) IDE
   (Integrated Development Environment). You will use this IDE to connect
   directly to and work within the development image.

   > [!TIP]
   > On Linux, do **not** install VS Code from the Snap store. Snap packaging
   > causes issues with some VS Code extensions, including those we need to use
   > for SDL development.
   >
   > Instead, install the official RPM for VS Code from Microsoft.
   >
   > See [Installing Visual Studio Code on Linux](https://code.visualstudio.com/docs/setup/linux).
   > Consult your distro's documentation for specific instructions on how to
   > install software directly from RPMs.

## Instructions

1. Install all Prerequisites (see previous section).
2. Install the *Dev Containers* and *Remote Development* VS Code extensions
   from Microsoft:

   In VS Code, open the Extensions sidebar and search for "Dev Containers".
   Both extensions should appear in the results; install them.
3. Configure the *Dev Containers* extension:
   a) Click on the gear icon on the "Extensions: Dev Container" info tab to
      open the extension's settings panel.
   b) **IF you installed *Podman* Desktop** (not Docker Desktop), find the
      "Dev › Containers: Docker Compose Path" setting and change the value to
      "podman-compose".
   c) **IF you installed *Podman* Desktop** (not Docker Desktop), find the
      "Dev › Containers: Docker Path" setting and change the value to "podman".

> [!NOTE]
> _Linux-specific instructions for *podman* or *Podman Desktop*_
>
> On Linux systems, additional steps must be taken to allow Dev Containers to
> function properly with `podman` or Podman Desktop:
>
> ```console
> systemctl --user status podman.socket
> echo "${XDG_RUNTIME_DIR}/podman/podman.sock"
> ```
>
> Copy the echoed path and update the "Dev › Containers: Docker Socket Path"
> setting with that value.

4. Clone the *sdl-sw-development* git repo to your "host" machine (i.e.,
   your student laptop or a desktop computer):
   ```console
   git clone https://github.com/KSU-AstroFlashes-SDL/sdl-sw-development.git
   ```
5. Open VS Code. Choose File > Open Folder... and select the "sdl-sw-developer"
   directory from the previous step. Click the \[Select\] (or \[Open\]) button.
6. After a few seconds, VS Code will recognize that the repo is a
   "devcontainer" repo, and you will see a prompt with a
   \[Reopen in container\] button. Click it.

   At this point, your VS Code window will refresh and you will see a loading
   notice "Connecting to Dev Container (show log)".  The process will take
   some time, so just be patient. Eventually, your VS Code window will refresh
   again. You will know the process has completed successfully when you see
   "Dev Container: SDL Development" in the lower left corner of your VS Code
   window.
7. Open a new terminal (Ctrl-\`). Note that the
   [FlashSat-1_Software](https://github.com/KSU-AstroFlashes-SDL/FlashSat-1_Software)
   repository has already been cloned into the `/home/developer` directory.
8. When you have finished your development session, click on
   "Dev Container: SDL Development" in the lower left corner of your VS Code
   window and choose "Close Remote Connection".
   ** Your progress is persisted automatically.**

At any time, you may repeat steps #5 and #6 to re-enter a development session.
(This process will complete MUCH quicker on subsequent invocations because the
development image will already exist on your "host" machine.)

### Post-install verification steps

Once VS Code attaches to your development container (which you'll know by
confirming that you see "Dev Container: SDL Development" in the lower-left
corner of your VS Code window), you can open a new terminal (Ctrl-`).

In that new terminal, your prompt SHOULD resemble:

```console
[developer@6e5afca7bb02 ~]
$
```

If you then `cd FlashSat-1_Software`, your prompt SHOULD now resemble:
(note the "(main)" Git branch identifier)

```console
[developer@6e5afca7bb02 ~/FlashSat-1_Software] (main)
$
```

Additionally, all of the following programs should be found:

```console
which fprime-bootstrap syft grype g++ gdb clang++ lldb clang-format clang-tidy python ruff uv nvim nano
```

If your prompt does not resemble the examples above, or if ANY of the above
programs are not found by the `which` command, something is wrong.
**Contact the Software subsection lead or deputy before proceeding.**

# Next steps

Try the
[F´ Hello World Tutorial](https://fprime.jpl.nasa.gov/latest/tutorials-hello-world/docs/hello-world/).

> [!TIP]
> Start with step (1b) of the tutorial - the `fprime-bootstrap` utility has already been installed in the development image.
