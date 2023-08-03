Hello.

I want to start off by crediting reddit user u/Alemar5 for the rainbow script used

This is a tool that I use to write fancy text graphics in my games!

This'll show you how to use it.

Symbols:
	# - line break
	[ - wave start
	] - wave end
	{ - shake start
	} - shake end
	< - rainbow start
	> - rainbow end
	
So this text tool is a little cringe. So here are some rules for writing
strings.

To get this out of the way, put the init_fancy_text() script
in the create event, and the update_fancy_fx() script in the step event.

Start by spacing the first of every sentence, like so.

str = " This is my string.";

Same thing with line breaks.

str = " This is my string.# This is the next line.#";

Also, sidenote, always end strings with a new line symbol.

I know this is a very basic messy way of doing things but I hope that you
could get some use out of it.

Have fun :3
