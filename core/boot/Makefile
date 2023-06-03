ASM = nasm

LINKER = ld

ELFS = bootloader.elf

LSCRIPT = -Ttext=0x7c00

AFLAGS = elf64

OBJS = bootsector.o data.o lib.o screen.o stdio.o

QEMU = qemu-system-x86_64

TARGET = bootloader

$(TARGET): $(OBJS)
	@$(LINKER) -s $(LSCRIPT) $(OBJS) -o $(ELFS)
	@objcopy -O binary $(ELFS) $(TARGET)

bootsector.o: bootsector.asm bootsector.inc data.asm screen.asm stdio.asm
	@$(ASM) -f $(AFLAGS) bootsector.asm

data.o: data.asm
	@$(ASM) -f $(AFLAGS) data.asm

lib.o: lib.asm
	@$(ASM) -f $(AFLAGS) lib.asm

screen.o: screen.asm
	@$(ASM) -f $(AFLAGS) screen.asm

stdio.o:
	@$(ASM) -f $(AFLAGS) stdio.asm

.PHONY: run clean clean-all

run:
	@-$(QEMU) -drive format=raw,file=$(TARGET)
clean:
	@-rm $(OBJS)

clean-all:
	@-rm *.o *.elf $(TARGET)
