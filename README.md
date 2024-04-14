# s2-oldflash

This is a port of Scratch 2.0 to Flash Player 9.0 (on branch `flash-9`) and
Flash Player 10.0 (on branch `flash-10`).  The Flash 10.0 port required almost
no changes and should be 100% functional compared to Flash 10.2.  However many
things are broken in the Flash 9 port.  This was motivated so Scratch could run
on old platforms like the PlayStation 3.

There is a precompiled SWF in `bin`
([https://github.com/jeandrek/s2-oldflash/raw/flash-9/bin/s2-flash9.swf download
link]).  If you want to compile yourself, set `FLEX_HOME` in build.properties or
local.properties, and place framework.swc from the Flex 2.0.1 SDK
([https://helpx.adobe.com/x-productkb/multi/flex-2-0-1-hotfix.html Adobe download link])
in this directory.  Flex also needs playerglobal.swc (also there).  Run `ant`
to build.

Apologies for the extremely messy commenting-out (may fix later).

I broke at least these things (for now at least) while getting it to work with Flash 9:

* Sound stuff
* Costume/PNG/vector stuff
* ZIP stuff (if not for JSON sb2s would work as long as they're uncompressed ZIPs…)
* Local files (no direct file I/O in Flash 9)
JSON
* Got rid of video sensing

Scratch 2 and this port are free software under the GPLv2 (see COPYING, and
README-scratch.md).