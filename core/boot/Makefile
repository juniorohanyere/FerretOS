ASM = nasm

LD = ld

ELFS = bootloader.elf

LDSCRIPT = -Ttext=0x7c00

AFLAGS = -f elf64

OBJS = bootloader.o

QEMU = qemu-system-x86_64

TARGET = bootloader

$(TARGET): $(OBJS)
	$(LD) -s $(LDSCRIPT) $(OBJS) -o $(ELFS)
	objcopy -O binary $(ELFS) $(TARGET)

bootloader.o: bootloader.asm
	$(ASM) $(AFLAGS) bootloader.asm

.PHONY: run clean clean-all

run:
	@-$(QEMU) -drive format=raw,file=$(TARGET)
clean:
	@-rm $(OBJS)

clean-all:
	@-rm *.o *.elf $(TARGET)
