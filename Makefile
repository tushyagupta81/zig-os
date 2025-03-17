CC=~/opt/cross/bin/i686-elf-gcc
LINKER=~/opt/cross/bin/i686-elf-as

kernel: src/kernel.c src/boot.s src/linker.ld
	mkdir -p build
	$(CC) -c src/kernel.c -o build/kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra
	$(LINKER) src/boot.s -o build/boot.o
	@mkdir -p isodir/boot/grub
	$(CC) -T src/linker.ld -o isodir/boot/myos.bin -ffreestanding -O2 -nostdlib build/boot.o build/kernel.o -lgcc

run:
	cp grub.cfg isodir/boot/grub/grub.cfg
	grub-mkrescue -o myos.iso isodir
	qemu-system-i386 -cdrom myos.iso

clean:
	rm *.o *.bin *.iso
