# OS Project
> An Operation System written in zig

## Aim

This is a OS for -
1. My own learning and fun
2. OS semester project

## Progress
- [x] Set up the development environment: Install a cross-compiler, QEMU, and other tools.
- [x] Write a simple bootloader in Assembly that loads the kernel from the disk into memory and jumps to it.
- [x] A barely working iso image that shows hello world(AKA hello world OS)
- [ ] Switch to protected mode to access 32-bit registers and more memory.
- [ ] Write a minimal kernel in C that can print to the screen.
- [ ] Handle interrupts and implement basic exception handling.
- [ ] Implement memory management: physical and virtual.
- [ ] Add processes and a simple scheduler.
- [ ] Develop drivers for hardware like keyboard, timer, and disk.
- [ ] Implement a file system.
- [ ] Gradually add more features like user mode, system calls, etc.

## Requirements
- zig (0.14.0-dev)
- qemu
- grub (MacOS users look below for withour grub)

### How to run

Creates the .elf file from the program and using grub creates a .iso file in the root dir
```bash
./make_iso.sh
```

```bash
qemu-system-i386 -cdrom kernel.iso
```

For MacOS users to load without a grub-mkrescue to make a iso image
```bash
zig build
qemu-system-i386 -kernel zig-out/bin/kernel.elf
```

### References
- [OSDev Wiki](https://wiki.osdev.org/)
- [Zig Bare Bones](https://wiki.osdev.org/Zig_Bare_Bones)
    - Main working of how to make the os work from zig
- [Bare metal zig](https://austinhanson.com/bare-metal-ziglang/)
    - The special while(true) to stop kernel from conitiously reloading
