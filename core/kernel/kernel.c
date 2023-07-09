#include "../drivers/screen.h"
#include "kernel.h"

/**
 * main - entry point for out kernel
 *
 * Return: always return 0
*/

int main(void)
{
	char *video_memory = (char *) 0xb8000;
	char *e = (char *) 0xb8000 + 2;
	char *r = (char *) 0xb8000 + 4;
	char *r2 = (char *) 0xb8000 + 6;
	char *e2 = (char *) 0xb8000 + 8;
	char *t = (char *) 0xb8000 + 10;

	clearscr();

	*video_memory = 'F';
	*e = 'E';
	*r = 'R';
	*r2 = 'R';
	*e2 = 'E';
	*t = 'T';

	return (0);
}
