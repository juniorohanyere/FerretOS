CC = gcc

CFLAGS = -ffreestanding -nostdlib -nostdinc -fno-builtin -fno-stack-protector \
	-Wall -pedantic -Werror -Wextra -std=gnu89

OBJS = ports.o screen.o

all: $(OBJS)

ports.o: ports.c ports.h
	@$(CC) $(CFLAGS) -c $< -o $@

screen.o: screen.c ports.h screen.h
	@$(CC) $(CFLAGS) -c $< -o $@

screen2.o: screen2.c screen.h ports.h
	@$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean clean-all

clean:
	@-rm $(OBJS)

clean-all: clean
	@-rm *.o
