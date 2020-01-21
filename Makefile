VERSION = 0.2
DESTDIR =
PREFIX = /usr
PACKAGE = thinyqt-session

build:

install:
	install -Dm755 $(PACKAGE).sh $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
	install -Dm644 thinyqt.desktop $(DESTDIR)$(PREFIX)/share/xsessions/thinyqt.desktop
	install -Dm755 fehbg $(DESTDIR)$(PREFIX)/share/thinyqt-session/fehbg
	install -Dm755 settings.sh $(DESTDIR)$(PREFIX)/share/thinyqt-session/settings.sh
	install -Dm644 qshutdown.conf $(DESTDIR)$(PREFIX)/share/thinyqt-session/qshutdown.conf

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
	rm -f $(DESTDIR)$(PREFIX)/share/xsessions/thinyqt.desktop
	rm -f $(DESTDIR)$(PREFIX)/share/thinyqt-session/fehbg
	rm -f $(DESTDIR)$(PREFIX)/share/thinyqt-session/settings.sh
	rm -f $(DESTDIR)$(PREFIX)/share/thinyqt-session/qshutdown.conf

clean:

rpm: $(PACKAGE).spec
	rsync -aC --delete . $(HOME)/rpmbuild/SOURCES/$(PACKAGE)-$(VERSION)
	tar czf $(HOME)/rpmbuild/SOURCES/$(PACKAGE)-$(VERSION).tar.gz -C $(HOME)/rpmbuild/SOURCES $(PACKAGE)-$(VERSION)
	rpmbuild -ta $(HOME)/rpmbuild/SOURCES/$(PACKAGE)-$(VERSION).tar.gz
