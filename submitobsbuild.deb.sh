#!/usr/bin/bash -x

PATH=/usr/bin:/usr/sbin/:/bin:/sbin
export PATH

MYDATE=`date`

# Get the version from the DEB changelog file
MYVER=`head -1 deb/debian/changelog | cut -f2 -d"("|cut -f1 -d "-"`

# Some variables for DEB package
DEBFULLNAME="Udo Seidel"
DEBEMAIL="udoseidel@gmx.de"

export DEBFULLNAME DEBEMAIL

# setup and create the needed files for DEB build
cd deb 
wget -nd https://dl.ui.com/unifi/$MYVER/UniFi.unix.zip
mkdir -p build/unifi-$MYVER
cp UniFi.unix.zip build/unifi-$MYVER
cp Makefile build/unifi-$MYVER
cd build
tar cfz unif-$MYVER.tar.gz unifi-$MYVER
cd unifi-$MYVER
dh_make -s -y -f ../unif-$MYVER.tar.gz
rm -f debian/*ex debian/*EX
cp ../../debian/* debian/

dpkg-buildpackage -S -us -uc

cd ..

# checkout the OSB package
osc co home:useidel unifictrl

cd home*

# clean up
cd unifictrl
osc remove *.debian.tar.xz
osc remove *.dsc
osc remove *.orig.tar.gz
# copy (updated) files to working directory and mark them for update
cp ../../*.debian.tar.xz . && osc add *.debian.tar.xz
cp ../../*.dsc . && osc add *.dsc
cp ../../*.orig.tar.gz . && osc add *.orig.tar.gz
cd ..

# upload changed content
osc ci -m "Update from $MYDATE" unifictrl

