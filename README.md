alwaysdata-utils
================

Scripts to install nodejs, newrelic, ..., on alwaysdata servers

## Install NewRelic

  ```sh
  $ curl -L https://raw.github.com/antistatique/alwaysdata-utils/master/ad_newrelic_install.sh | bash
  ```

### Overlapping application name

### Symfony

Update your `app/config/parameters.yml`:

  ```yaml
  newrelic.application_name: 'App'
  ```

### Drupal

Update your `sites/default/settings.php`:

  ```php
  if (extension_loaded('newrelic')) {
    newrelic_set_appname('App');
  }
  ```

## Install Nodejs and NPM
 
  ```sh
  $ curl -L https://raw.githubusercontent.com/antistatique/alwaysdata-utils/master/ad_node_install.sh | bash
  ```
