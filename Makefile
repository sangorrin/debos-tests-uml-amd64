build_qemu_img_uml:
	docker run --rm --interactive --tty \
		--user $(shell id -u) --workdir /recipes \
		--mount "type=bind,source=$(shell pwd),destination=/recipes" \
		--mount "type=bind,source=/dev/shm,destination=/dev/shm" \
		--security-opt label=disable godebos/debos \
		--print-recipe \
		--fakemachine-backend=uml \
		uml.yaml
	mv qemu.img qemu-uml.img

build_qemu_img_kvm:
	docker run --rm --interactive --tty --device /dev/kvm \
		--user $(shell id -u) --workdir /recipes \
		--mount "type=bind,source=$(shell pwd),destination=/recipes" \
		--mount "type=bind,source=/dev/shm,destination=/dev/shm" \
		--security-opt label=disable godebos/debos \
		--print-recipe \
		--fakemachine-backend=kvm \
		uml.yaml
	mv qemu.img qemu-kvm.img

.run_qemu_img:
	qemu-system-x86_64 \
		-m 1G \
		-device virtio-scsi-pci \
		-device scsi-hd,drive=hd0 \
		-blockdev driver=file,node-name=hd0,filename=qemu-$(BACKEND).img \
		-device e1000,netdev=net0 \
		-netdev user,hostfwd=tcp:127.0.0.1:5555-:22,id=net0,hostfwd=tcp:127.0.0.1:2159-:2159 \
		-nographic -serial mon:stdio

run_qemu_img_kvm:
	make .run_qemu_img BACKEND=kvm

run_qemu_img_uml:
	make .run_qemu_img BACKEND=uml

