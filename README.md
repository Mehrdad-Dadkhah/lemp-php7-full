# lemp-php7-full
nginx with php7 full pack and supervisord

It is base on [php7 image](https://hub.docker.com/r/mehrdadkhah/php7) that contains:

 - last stable version of Redis extension (official version)
 - Intl extension (official version)
 - Apcu extension ([official build for php7](https://pecl.php.net/package/APCu))
 - Soap
 - PDO (MySQL, PostgreSQL, Sqlite)
 - GD
 - iconv
 - mbstring
 - composer
 - xdebug

and in ffmpeg tag image contain latest version of FFmpeg.
----------
##usage

    docker pull mehrdadkhah/lemp-php7