#include "ports.h"
#include "screen.h"

/**
 * clearscr - function that clears the screen
 *
 * Return: return nothing
*/

void clearscr(void)
{
	int i;
	int size = MAX_X * MAX_Y;
	char *screen = VIDEO_ADDRESS;

	for (i = 0; i < size; i++)
	{
		screen[i*2] = ' ';
		screen[i*2+1] = WHITE_ON_BLACK;
	}
	setcur(getxy(0,0));
}

/**
 * getcur - gets the current cursor position
 *
 * Description: the VGA ports will be used to get the current
 *		cursor position, requesting high byte of the cursor
 *		offset (data 14) and requesting low byte (data 15)
 *
 * Return: return the position of size of character cell
*/
/*
int getcur(void)
{
	int offset;

	outb(SCR_CTRL, 14);

	offset = inb(SCR_DATA) << 8; */	/* High byte: << 8 */
/*
	outb(SCR_CTRL, 15);

	offset += inb(SCR_DATA);

	return offset * 2;*/ /* position * size of character cell */
/*} */

/**
 * setcur - sets or updates the cursor offset for the screen
 *
 * @p: the cursor position or offset
 *
 * Description: the setcur function is similar to the getcur function
 *		but instead of reading data, it writes the data
 *
 * Return: return nothing
*/

void setcur(int p)
{
	p /= 2;

	outb(SCR_CTRL, 14);
	outb(SCR_DATA, (unsigned char)(p >> 8));
	outb(SCR_CTRL, 15);
	outb(SCR_DATA, (unsigned char)(p & 0xff));
}

