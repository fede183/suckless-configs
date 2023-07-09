/* See LICENSE file for copyright and license details. */
#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <sys/ioctl.h>
#include <unistd.h>
#include <stdlib.h>
#include <ctype.h>

#include "../slstatus.h"
#include "../util.h"

const char *gamepad_connect(const char *unused)
{
	char *bluetooth_list = (char *)run_command("timeout 5 bluetoothctl scan on");
	char *gamepad_id = "8C:41:F2:07:02:3F";

    if (strstr(bluetooth_list, gamepad_id) != NULL) {
        return "yes";
    }
	
	return "no";
}