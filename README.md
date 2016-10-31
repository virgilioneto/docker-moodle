# Docker Moodle

Base container for Moodle over PHP + Apache.
This image does not contain a database application, you will need to install your own database container.

## Volumes

You can mount volumes for Moodle root and moodle data to keep all data on an external storage.

* **Moodle root**: -v /path/to/mymoodle:/var/www/html:ro
* **Moodle data**a: -v /path/to/moodledata:/var/www/moodledata

### Permissions

* **Moodle root**: This folder is read only, so to setup the site and/or install some plugin you need to copy files using mounted volume;
* **Moodle data**: This folder hava full read/write because moodle uses it to store data;

## How to run

To run Moodle 3.1+ over PHP 5.6 + apache

```sh
docker run -d \
  -p 8080:80 \
  --name moodle \
  -v /path/to/mymoodle:/var/www/html:ro \
  -v /path/to/moodledata:/var/www/moodledata \
  virgilioneto/moodle:php56-moodle31
```

## TODO

* **PHP Config**: Expose php config file for external configuration
* **HTTPD Config**: Expose apache config file for external configuration
