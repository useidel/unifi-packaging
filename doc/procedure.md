# Steps to prepare src packages

Download UniFi.unix.zip

Rename for Fedora and Pack in tar.gz (with the Makefile) for Debian und Co.

## For Fedora:
```
export MYVER=6.0.45
mv UniFi.unix.zip UniFi-$MYVER.unix.zip
```
Now adapt `unifi.spec` (version and changelog)

## For Debian and Co.

see also: https://www.debian.org/doc/manuals/maint-guide/

```
export DEBFULLNAME="Udo Seidel"
export DEBEMAIL="udoseidel@gmx.de"
export MYVER=6.0.45

mkdir -p build/unifi-$MYVER
cp UniFi.unix.zip build/unifi-$MYVER
cp Makefile build/unifi-$MYVER
cd build
tar cfz unif-$MYVER.tar.gz unifi-$MYVER
cd unifi-$MYVER
dh_make -s -y -f ../unif-$MYVER.tar.gz
rm -f debian/*ex debian/*EX
cp ../../debian/* debian/
```

Now adapt `changelog` (and other files if needed)

```
dpkg-buildpackage -S -us -uc
```


