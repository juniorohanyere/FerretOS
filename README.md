# clios

`clios` is an acronym for `command line interface operating system` 

> An operating system (OS) that manages computer hardware and software resources and provides common services for computer programs via a command-line interface (CLI).

> A light-weight, but complex, terminal-based OS where all the basic features of an OS are displayed on, and operated from, the CLI.

# Key Features

**User interface:** provides a friendly `user interface` that allows users to interact with the system via a command-line interface.

**File system management:** manages the `organisation` and `storage` of files on disk, providing a hierachical file system and file access controls, via the CLI.

**Process management:** manages the `execution` of programs or proceses, allocating resources such as CPU time, memory, and I/O devices.

**Memory management:** manages the `allocation` and `deallocation` of memory to processes, ensuring that each process has access to the memory it needs.

**Device management:** manages the `interaction` between the computer and its peripheral devices, such as printers, scanners, and network adapters.

**Security:** provides `security features` such as `user authentication`, `access controls`, and `encryption` to protect the system and its data from `unauthorised access`.

**Networking:** provides networking features such as `TCP/IP` protocol support, `network configuration`, and `network device drivers`.

**Web interfacing:** provides `web browsing` features, `interfaced` through the command line.

**Multitasking:** allows multiple programs or processes to `run simultaneously`, sharing system resources such as CPU time and memory.

**Error handling:** provides error handling features that `detect` and `recover` from errors such as `hardware failures`, `software crashes`, and `network errors`.

**Virtualisation:** provides virtualisation features that allow multiple operating systems or instances of an operating system to run on a single physical machine, and also ability to run on virtualisation softwares, like `virtual box` and `vmware`, as a `guest operating system`.

**Windowless:** provides a command-line interface, where there is no support for `windowing` features or `graphical user interface (GUI)` , every activity is carried out on a `single terminal`.

**Customization:** provides customization for system `layouts` and `appearance`.

# Project Structure

```
clios
 |
 |-core/
 |  |
 |  |-boot/
 |  |  |
 |  |  |-*.asm
 |  |  |-*.c
 |  |  |-*.h
 |  |  |-Makefile
 |  |  |-README.md
 |  |
 |  |-cpu/
 |  |  |
 |  |  |-Makefile
 |  |  |-README.md
 |  |
 |  |-drivers/
 |  |  |
 |  |  |-Makefile
 |  |  |-README.md
 |  |
 |  |-kernel/
 |  |  |
 |  |  |-Makefile
 |  |  |-README.md
 |  |
 |  |-Makefile
 |  |-README.md
 |
 |-os/
 |  |
 |  |-libs/
 |  |  |
 |  |  |-Makefile
 |  |  |-README.md
 |  |
 |  |-shell/
 |  |  |
 |  |  |-lish/
 |  |  |  |
 |  |  |  |-commands/
 |  |  |  |  |
 |  |  |  |  |-*.c
 |  |  |  |  |-*.h
 |  |  |  |  |-Makefile
 |  |  |  |  |-README.md
 |  |  |  |
 |  |  |  |-shell/
 |  |  |  |  |
 |  |  |  |  |-*.c
 |  |  |  |  |-*.h
 |  |  |  |  |-Makefile
 |  |  |  |  |-README.md
 |  |  |  |
 |  |  |  |-Makefile
 |  |  |  |-README.md
 |  |  |
 |  |  |-Makefile
 |  |  |-README.md
 |  |
 |  |-sysroot/
 |  |  |
 |  |  |-bin/
 |  |  |  |
 |  |  |  |-(executables)
 |  |  |
 |  |  |-devices/
 |  |  |  |
 |  |  |  |-(?)
 |  |  |
 |  |  |-etc/
 |  |  |  |
 |  |  |  |-(?)
 |  |  |  
 |  |  |-home/
 |  |  |  |
 |  |  |  |-(?)
 |  |  |
 |  |  |-media/
 |  |  |  |
 |  |  |  |-(?)
 |  |  |
 |  |  |-root/
 |  |  |  |
 |  |  |  |-(?)
 |  |  |
 |  |  |-tmp/
 |  |  |  |
 |  |  |  |-(?)
 |  |  |
 |  |  |-usr/
 |  |  |  |
 |  |  |  |-(?)
 |  |  |  |
 |  |  |  |-bin/
 |  |  |     |
 |  |  |     |-(executables)
 |  |  |
 |  |  |-Makefile
 |  |  |-README.md
 |  |
 |  |-term/
 |  |  |
 |  |  |-Makefile
 |  |  |-README.md
 |  |
 |  |-utils/
 |  |  |
 |  |  |-Makefile
 |  |  |-README.md
 |  |
 |  |-Makefile
 |  |-README.md
 |
 |-AUTHORS.md
 |-CONTRIBUTING.md
 |-CONTRIBUTORS.md
 |-LICENSE
 |-Makefile
 |-README.md
 |-SUPPORTERS.md

```
