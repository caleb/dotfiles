PHP
====

Configures [PHP][1], loads version managers, and defines aliases.

php-version.sh
------

Manage PHP versions with [php-version][6].

### Settings

#### Auto-Switch

To enable auto switching the PHP version on directory change based on the
.php-version file, add the following line to *zpreztorc*:

    zstyle ':prezto:module:php:php-version' auto-switch 'yes'

Authors
-------

*The authors of this module should be contacted via the [issue tracker][5].*

  - [Caleb Land](https://github.com/caleb)

[1]: http://www.php.net
[2]: https://github.com/wilmoore/php-version
