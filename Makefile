#
# This Makefile is provided in case you have no imake, or it
# doesn't work on your system.  Copy this file to "Makefile"
# and edit the variables below to suit your system.  Be sure
# to define whatever compilation flags your system needs, eg
# if you're using AIX, add "-DBSD_INCLUDES" to "CFLAGS".
#

CFLAGS = -O3 -g -DSHAPE -std=gnu11
LDFLAGS = -lXext -lX11
BIN = /usr/local/bin

MANDIR = /usr/local/man/man1
MANSUFFIX = 1

#
# These variables shouldn't need to be changed
#

OBJS = 9wm.o manage.o menu.o client.o grab.o cursor.o error.o
HFILES = dat.h fns.h

#
# Or these rules either
#

all: 999

999: $(OBJS)
	$(CC) $(CFLAGS) -o 999 $(OBJS) $(LDFLAGS)

install: 999
	cp 999 $(BIN)/999

install.man:
	cp 999.man $(MANDIR)/999.$(MANSUFFIX)

$(OBJS): $(HFILES)

trout: 999.man
	troff -man 999.man >trout

vu: trout
	xditview trout

clean:
	rm -f 999 *.o core bun trout
