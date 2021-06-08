# Overview

This small example is aimed at testing the ability to build
an amd64 Debos image using `uml` as the backend

# Quickstart

Build the QEMU image
```
$ make build_qemu_img
```

Run the image with QEMU (tested on Ubuntu 20) and
confirm that it boots correctly.
```
$ make run_qemu_img
[Note] login with "root" (no password)
```
