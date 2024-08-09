# clean up the temp folder
rm temp/kernel.o
# assamble the kernel
ca65 src/kernel/kernel.asm -o temp/kernel.o --cpu 65c02
# link the kernel
ld65 temp/kernel.o -o build/kernel -C linker/ld.cfg 

