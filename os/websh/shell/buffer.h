#ifndef BUFFER_H
#define BUFFER_H

#define BUFFER_SIZE 1024

int getbuffer(char **buf);
int splitbuffer(char *dest[], char **src);
void setnull(char *ptr[]);

#endif	/* BUFFER_H */
