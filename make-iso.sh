nasm -f elf32 loader.s
gcc -m32 -c sum_of_three.c -o sum_of_three.o
ld -T link.ld -melf_i386 loader.o sum_of_three.o -o kernel.elf
cp kernel.elf iso/boot/
genisoimage -R                              \
                -b boot/grub/stage2_eltorito    \
                -no-emul-boot                   \
                -boot-load-size 4               \
                -A os                           \
                -input-charset utf8             \
                -quiet                          \
                -boot-info-table                \
                -o os.iso                       \
                iso
bochs -f bochsrc.txt -q
