VERSION = 0.0
DESTDIR =
PREFIX = /usr
PACKAGE = thinyqt-session

build:

install:
	install -Dm755 $(PACKAGE).sh $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
	install -Dm644 thinyqt.desktop $(DESTDIR)$(PREFIX)/share/xsessions/thinyqt.desktop
	install -Dm644 qtpanelrc $(DESTDIR)$(PREFIX)/share/thinyqt-session/qtpanelrc
	install -Dm644 bg-saved.cfg $(DESTDIR)$(PREFIX)/share/thinyqt-session/bg-saved.cfg
	install -Dm755 settings.sh $(DESTDIR)$(PREFIX)/share/thinyqt-session/settings.sh
	install -Dm644 sxhkdrc $(DESTDIR)$(PREFIX)/share/thinyqt-session/sxhkdrc
	install -Dm644 qshutdown $(DESTDIR)$(PREFIX)/share/thinyqt-session/qshutdown

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
	rm -f $(DESTDIR)$(PREFIX)/share/xsessions/thinyqt.desktop
	rm -f $(DESTDIR)$(PREFIX)/share/thinyqt-session/qtpanelrc
	rm -f $(DESTDIR)$(PREFIX)/share/thinyqt-session/bg-saved.cfg
	rm -f $(DESTDIR)$(PREFIX)/share/thinyqt-session/settings.sh
	rm -f $(DESTDIR)$(PREFIX)/share/thinyqt-session/sxhkdrc
	rm -f $(DESTDIR)$(PREFIX)/share/thinyqt-session/qshutdown

clean:

rpm: $(PACKAGE).spec
	rsync -aC --delete . $(HOME)/rpmbuild/SOURCES/$(PACKAGE)-$(VERSION)
	tar czf $(HOME)/rpmbuild/SOURCES/$(PACKAGE)-$(VERSION).tar.gz -C $(HOME)/rpmbuild/SOURCES $(PACKAGE)-$(VERSION)
	rpmbuild -ta $(HOME)/rpmbuild/SOURCES/$(PACKAGE)-$(VERSION).tar.gz
