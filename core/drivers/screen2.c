#include "ports.h"
#include "screen.h"

/**
 * getxy - gets the offset in row and column
 *
 * @x: the column offset
 * @y: the row offset
 *
 * Return: return the grand offset
*/

int getxy(int x, int y)
{
	return (2 * (y * MAX_X + x));
}

/**
 * getx: gets the offset position in column
 *
 * @p: the offset
 *
 * Return: return the grand offset
*/

int getx(int p)
{
	offset = gety(p);

	return ((p - (offset * 2 * MAX_X)) / 2);
}

/**
 * gety - gets the offset position in row
 *
 * @p: the offset
 *
 * Return: return the grand offset
*/

int gety(int p)
{
	return (p / (2 * MAX_X));
}
