#ifndef COMMANDS_H
#define COMMANDS_H

/**
 * struct commands - type definition for a struct commands
 *
 * @command: variable to map commands entered
 *	     to a corresponding command function
 * @command_func: command function
*/

typedef struct commands
{
	char command[1024];
	int (*command_func)(char **);
} command_t;

#endif	/* COMMANDS_H */
