FLAGS = build/kernel.asm.o build/kernel.o
FILES = -g -ffreestanding -nostdlib -nostartfiles -nodefaultlibs -Wall -O0 -Iinc 

# all: os-image

# run: all 
#	bochs

# os-image: bin/boot.bin bin/kernel.bin
#	cat $^ os-image

# bin/kernel.bin: build/load_kernel.o build/kernel.o
# 	ld -o bin/kernel.bin -Ttext 0x1000 $^ --oformat binary

# build/kernel.o: kernel/kernel.c
#	gcc -ffreestanding -c $< -o $@

# build/load_kernel.o: bootloader/load_kernel.asm
#	nasm $< -f elf -o $@

bin/boot.bin: bootloader/boot.asm
#	nasm $< -f bin -o $@

# build/kernel.dis: bin/kernel.bin
# 	ndisasm -b 32 #< > $@

bootloader/boot.bin: bootloader/boot.asm
	nasm -f bin bootloader/boot.asm -o bin/boot.bin

qemu: bootloader/boot.bin
	qemu-system-x86_64 -drive format=raw,file=bin/boot.bin

clean:
	rm -f bin/boot.bin