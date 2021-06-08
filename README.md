# Overview

This small example is aimed at testing the ability to build
an amd64 Debos image using `uml` as the backend

# Quickstart

Build the QEMU image with `kvm` as backend
```
$ make build_qemu_img_kvm
```

Run the image with QEMU (tested on Ubuntu 20) and
confirm that it boots correctly.
```
$ make run_qemu_img
[Note] login with "root" (no password)
```

Build the QEMU image with `uml` as backend
```
$ make build_qemu_img_uml
```

Run the image again and see if the boot fails or not
```
$ make run_qemu_img
```
