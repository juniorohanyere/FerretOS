ASM = nasm

ASMFLAGS = bin

SRC = bootsector.asm

DEPS = bootloader.asm data.asm string.asm validate.asm

INCLUDES = bootloader.inc bootsector.inc data.inc string.inc

QEMU = qemu-system-x86_64

TARGET = bootloader.bin

all: $(TARGET)

$(TARGET): $(SRC) $(DEPS) $(INCLUDES)
	@$(ASM) -f $(ASMFLAGS) $< -o $@

.PHONY: clean

clean:
	@-rm $(TARGET)
