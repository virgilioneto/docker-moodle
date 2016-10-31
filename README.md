# Docker Moodle

## Volumes

You can mount volumes for Moodle root and moodle data to keep all data on an external storage.

* Moodle root: -v /path/to/mymoodle:/var/www/html:ro
* Moodle data: -v /path/to/moodledata:/var/www/moodledata

### Permissions

* Moodle root: This folder is read only, so to setup the site and/or install some plugin you need to copy files using mounted volume;
* Moodle data: This folder hava full read/write because moodle uses it to store data;

## TODO

* PHP Config: Expose php config file for external configuration
* HTTPD Config: Expose apache config file for external configuration
