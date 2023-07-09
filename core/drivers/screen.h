#ifndef SCREEN_H
#define SCREEN_H

#define VIDEO_ADDRESS ((char *) 0xb8000)
#define WHITE_ON_BLACK 0x0f
#define RED_ON_WHITE 0xf4

#define MAX_X 80
#define MAX_Y 25

#define SCR_CTRL 0x3d4
#define SCR_DATA 0x3d5

int getxy(int x, int y);
int getx(int p);
int gety(int p);

void clearscr(void);
int getcur(void);
void setcur(int p);

/* void fbfprintf(char *str, int x, int y); */
/* void fbprintf(char *str); */

#endif	/* SCREEN_H */
