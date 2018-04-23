#!/bin/bash

NRVERSION="8.0.0.204"
NRVERSIONFULL="8.0.0.204-linux"
NRBASEDIR="$HOME/newrelic"
MODULEDIR="$HOME/lib/php/extensions"
# get this value from 'uname -m'
ARCH=x64
PHPAPI=`php -i|grep "PHP Extension =>" | sed 's/PHP Extension => //'` # I need to learn bash...
PHPZTS=""
 
mkdir -p $NRBASEDIR
mkdir -p $MODULEDIR
 
cd $NRBASEDIR
 
echo ">> Download the New Relic Agent..."
wget --no-check-certificate "https://download.newrelic.com/php_agent/archive/$NRVERSION/newrelic-php5-$NRVERSIONFULL.tar.gz"
 
echo ">> Unzip archive..."
gzip -dc "newrelic-php5-$NRVERSIONFULL.tar.gz" | tar xf -
 
echo ">> Installing..."
rm -f $MODULEDIR/newrelic.so
ln -s $NRBASEDIR/newrelic-php5-$NRVERSIONFULL/agent/$ARCH/newrelic-${PHPAPI}${PHPZTS}.so $MODULEDIR/newrelic.so
 
rm "newrelic-php5-$NRVERSIONFULL.tar.gz"
 
echo ""
echo ""
echo "Add this config in your php.ini"
echo ";; NEW RELIC"
echo "extension=$MODULEDIR/newrelic.so"
echo "newrelic.appname=\"$USER-global\""
echo "newrelic.license=\"YOUR-LICENSE\""
echo "newrelic.daemon.logfile=\"$HOME/log/newrelic-daemon.log\""
echo "newrelic.daemon.location=\"$NRBASEDIR/newrelic-php5-$NRVERSIONFULL/daemon/newrelic-daemon.$ARCH\""
echo "newrelic.capture_params=On"
echo ""
