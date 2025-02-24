QEMU = qemu-system-x86_64
NASM = nasm -f bin

bootloader/boot.bin: bootloader/boot.asm
	$(NASM) bootloader/boot.asm -o bootloader/boot.bin

qemu: bootloader/boot.bin
	$(QEMU) -drive format=raw,file=bootloader/boot.bin

clean:
	rm -f bootloader/boot.bin