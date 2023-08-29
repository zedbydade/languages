require "mkmf"

$LDFLAGS << " -Ltarget/debuf -lfoo "

create_makefile("foo")
