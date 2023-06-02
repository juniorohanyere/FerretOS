#include <string.h>
#include <stdlib.h>

#include "commands.h"

const command_t cmd[] = {
	{"cd", change_dir},
	{"exit", exit_sh},
	{"clear", clear_scr},
	{"ls", list_dir},
	{"rm", remove_fdir},
	{"find", find_file},
	{"grep", grep_buffer},
	{"help", help_message},
};

/**
 * map_commands - function that displays the resulting outcome
 *		  of a command entered
 *
 * @args: the command entered
 *
 * Return: return 0 on success
 *	   return 1 on if command entered is not available
*/

int map_commands(char *args[])
{
	int i, flag;

	/* loop to access index "i" of available commands */
	for (i = 0; strcmp(cmd[i].command, "\0") != 0; i++)
	{
		/* check if command entered is available */
		if (strcmp(cmd[i].command, args[0]) == 0)
		{
			flag = 0;
			break;
		}

		else
			flag = 1;
	}

	if (flag == 0)
	{
		cmd[i].command_func(args);
		return (flag);
	}

	else
	{
		printf("%s: command not found\n", args[0]);	/**
								 * a specific function
								 * should be made for this
								*/
		return (flag);
	}

}
