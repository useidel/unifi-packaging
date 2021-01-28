MYFILE=UniFi.unix.zip
MYDIR=UniFi
MYROOT=debian/unifi/
MYDEST=$(MYROOT)/usr/lib/unifi/

all:
	unzip $(MYFILE)
	rm -rf $(MYDIR)/bin
	rm -rf $(MYDIR)/readme.txt

install:
	mkdir -p  $(MYDEST)/bin
	mkdir -p  $(MYROOT)/etc/init.d/
	mkdir -p  $(MYROOT)/etc/logrotate.d/
	mkdir -p  $(MYROOT)/etc/pam.d/
	mkdir -p  $(MYROOT)/lib/systemd/system/
	cp debian/unifi.myinit $(MYDEST)/bin/unifi.init
	cp debian/ubnt-apttool $(MYDEST)/bin
	cp debian/unifi.logrotate $(MYROOT)/etc/logrotate.d/unifi
	cp debian/unifi.pam.in $(MYROOT)/etc/pam.d/unifi
	cp debian/unifi.service $(MYROOT)/lib/systemd/system/
	cd $(MYDIR) && cp -a * ../$(MYDEST) && cd -

clean:
	rm -rf $(MYDIR)
	rm -rf $(MYDEST)
