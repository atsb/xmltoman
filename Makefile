prefix=/usr/local
PACKAGE=xmltoman
VERSION=0.6
DISTNAME=$(PACKAGE)-$(VERSION)
DISTFILES= COPYING Makefile README xml/ xmlmantohtml xmltoman xmltoman.css xmltoman.dtd xmltoman.xsl

all: install

xmltoman.1: xml/xmltoman.1.xml
	chmod 0744 xmltoman
	./xmltoman $< > $@

xmlmantohtml.1: xml/xmlmantohtml.1.xml
	chmod 0744 xmlmantohtml
	./xmltoman $< > $@

install:
	install -D -m 0744 xmltoman $(DESTDIR)$(prefix)/bin/xmltoman
	install -D -m 0744 xmlmantohtml $(DESTDIR)$(prefix)/bin/xmlmantohtml
	install -D -m 0644 xmltoman.dtd $(DESTDIR)$(prefix)/share/xmltoman/xmltoman.dtd
	install -D -m 0644 xmltoman.css $(DESTDIR)$(prefix)/share/xmltoman/xmltoman.css
	install -D -m 0644 xmltoman.xsl $(DESTDIR)$(prefix)/share/xmltoman/xmltoman.xsl
	install -D -m 0644 xmltoman.1 $(DESTDIR)$(prefix)/share/man/man1/xmltoman.1
	install -D -m 0644 xmlmantohtml.1 $(DESTDIR)$(prefix)/share/man/man1/xmlmantohtml.1

dist:
	[ -d $(DISTNAME) ] && rm -rf $(DISTNAME) || true
	mkdir $(DISTNAME)
	cp -aR $(DISTFILES) $(DISTNAME)
	tar zcvf $(DISTNAME).tar.gz $(DISTNAME)
	rm -rf $(DISTNAME)

clean:
	rm -f *~ *.1 xml/*~
