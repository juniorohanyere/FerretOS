# assembler
ASM = nasm

# assembler flags
AFLAGS = -f elf64

# source files
SRCS = bootsector.asm

# dependencies
DEPS =

# includes
INCLUDES =

# target - to be linked with a kernel.o file
# found in the 'FerretOS/core/kernel' directory
TARGET = bootloader.o


all: $(TARGET)

$(TARGET): $(SRCS) $(DEPS) $(INCLUDES)
	@$(ASM) $(AFLAGS) $< -o $@

.PHONY: clean

clean:
	@-rm $(TARGET)
