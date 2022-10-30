#!/usr/bin/bash -x

PATH=/usr/bin:/usr/sbin/
export PATH

MYDATE=`date`

# checkout the OSB package
osc co home:useidel unifictrl

cd home*

# clean up
cd unifictrl 
osc remove UniFi*.unix.zip
cd ..

# copy (updated) files to working directory
# The download directory for the UniFi*.unix.zip is coded 
# in getsources4RPM.sh and ist made fit for the Copr build
cp /github/home/rpmbuild/SOURCES/UniFi*.unix.zip unifictrl/
cp ../fedora-rpm/*spec unifictrl/

# mark files for update (so far only needed for UniFi*.unix.zip)
cd unifictrl
osc add UniFi*.unix.zip
cd ..

# upload changed content
osc ci -m "$MY_GITHUB_COMMIT_MSG: $MYDATE" unifictrl

