//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
    {"Mic: ",    "~/.local/bin/mic.sh",    0, 10},
    {"Vol: ",    "~/.local/bin/vol.sh",    0, 11},
    {"",         "~/.local/bin/keymap.sh", 1, 12},
	{"", "date '+%b %d (%a) %I:%M%p'",				 5,	0},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
