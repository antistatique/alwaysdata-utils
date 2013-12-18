#!/bin/bash
 
NRVERSION="4.1.5.24-linux"
NRBASEDIR="$HOME/newrelic"
MODULEDIR="$HOME/lib/php/extensions"
# get this value from 'uname -m'
ARCH=x64
# get this value from 'php -i|grep "PHP Extension"'
PHPAPI=20100525
PHPZTS=""
 
mkdir -p $NRBASEDIR
mkdir -p $MODULEDIR
 
cd $NRBASEDIR
 
echo ">> Download the New Relic Agent..."
wget "https://download.newrelic.com/php_agent/release/newrelic-php5-$NRVERSION.tar.gz"
 
echo ">> Unzip archive..."
gzip -dc "newrelic-php5-$NRVERSION.tar.gz" | tar xf -
 
echo ">> Installing..."
rm -f $MODULEDIR/newrelic.so
ln -s $NRBASEDIR/newrelic-php5-$NRVERSION/agent/$ARCH/newrelic-${PHPAPI}${PHPZTS}.so $MODULEDIR/newrelic.so
 
rm "newrelic-php5-$NRVERSION.tar.gz"
 
echo ""
echo ""
echo "Add this config in your php.ini"
echo ";; NEW RELIC"
echo "extension=$MODULEDIR/newrelic.so"
echo "newrelic.appname=\"$USER-global\""
echo "newrelic.license=\"YOUR-LICENSE\""
echo "newrelic.daemon.logfile=\"$HOME/log/newrelic-daemon.log\""
echo "newrelic.daemon.location=\"$NRBASEDIR/newrelic-php5-$NRVERSION/daemon/newrelic-daemon.$ARCH\""
echo "newrelic.capture_params=On"
echo ""
