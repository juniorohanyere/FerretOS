# assembler
ASM = nasm

# assembler flags
AFLAGS = -f elf64

# source files
SRCS = bootsector.asm

# dependencies
DEPS = bootloader.asm data.asm gdt.asm getbuffer.asm keyboard.asm string.asm \
	validate.asm

# includes
INCLUDES = bootloader.inc bootsector.inc data.inc string.inc

# target - to be linked with a kernel.o file
# found in the 'FerretOS/core/kernel' directory
TARGET = bootloader.elf


all: $(TARGET)

$(TARGET): $(SRCS) $(DEPS) $(INCLUDES)
	@$(ASM) $(AFLAGS) $< -o $@

.PHONY: clean clean-all

clean:
	@-rm $(TARGET)

clean-all:
	@-rm *.elf
