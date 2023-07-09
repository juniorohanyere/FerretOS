CC = gcc

LD = ld

CFLAGS = -ffreestanding -nostdlib -nostdinc -fno-builtin -fno-stack-protector \
	-Wall -pedantic -Werror -Wextra -std=gnu89

LDFLAGS = -Ttext 0x1000 --oformat binary

OBJS = ../boot/stage2/bootloader.o kernel.o

TARGET = kernel.bin

all: $(TARGET)

$(TARGET): $(OBJS)
	@$(LD) $(LDFLAGS) $^ -o $@

kernel.o: kernel.c
	@$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean clean-all

clean:
	@-rm *.o

clean-all: clean
	@-rm $(TARGET)
