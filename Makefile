PREFIX ?= /usr
DESTDIR ?=

all:

install:
	install -D -m 0755 audioledd $(DESTDIR)$(PREFIX)/sbin/audioledd
	install -D -m 0644 audioledd.service $(DESTDIR)$(PREFIX)/lib/systemd/system/audioledd.service

.PHONY: all install
