ASM = nasm

LINKER = ld

ELF = bootloader.elf

LSCRIPT = -Ttext=0x7c00

ASMFLAGS = elf64

OBJS = bootsector.o data.o lib.o screen.o stdio.o

QEMU = qemu-system-x86_64

TARGET = bootloader

all: $(TARGET)

$(TARGET): $(OBJS)
	@$(LINKER) $(LSCRIPT) $^ -o $(ELF)
	@objcopy -O binary $(ELF) $@

bootsector.o: bootsector.asm bootsector.inc data.asm screen.asm stdio.asm
	@$(ASM) -f $(ASMFLAGS) $< -o $@

data.o: data.asm
	@$(ASM) -f $(ASMFLAGS) $< -o $@

lib.o: lib.asm
	@$(ASM) -f $(ASMFLAGS) $< -o $@

screen.o: screen.asm
	@$(ASM) -f $(ASMFLAGS) $< -o $@

stdio.o: stdio.asm
	@$(ASM) -f $(ASMFLAGS) $< -o $@

.PHONY: run clean clean-all

run:
	@-$(QEMU) -drive format=raw,file=$(TARGET)
clean:
	@-rm $(OBJS)

clean-all:
	@-rm *.o *.elf $(TARGET)
