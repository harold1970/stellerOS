ca65 src/kernel/kernel.asm -o src/temp/kernel.o --cpu 65c02
ld65 temp/kernel.o -o kernel -C linker/ld.cfg