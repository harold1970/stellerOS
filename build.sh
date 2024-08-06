ca65 src/boot/kernel.asm -o src/boot/kernel.o --cpu 65c02
ld65 kernel.o -o kernel -C linker/ld.cfg