# Morris Federation -  WordPress Docker Compose

Tools for local development of the Morris Federation Website.

Based on https://github.com/danwatford/bfw-wordpress-docker-compose

Based on retrieved copies of the Morris Federation website files and database, this docker-compose project can be used
to work on the website's custom theme and plugins, while using the latest wordpress files (including plugins) as used on the 
production site.

## Requirements

Docker and Docker Compose must be installed.

## Usage

Download the SQL dump of the live wordpress database and place in the wp-data directory.

Download the website files and place in the public_html directory.

To run the website:

```
docker-compose up
```

To stop the webiste:

```
docker-compose down
```

To remove the volumes associated with the project:

```
docker-compose down -v
```

## Changes to the upstream project (https://github.com/nezhar/wordpress-docker-compose)

The Morris Federation website uses HTTPS. The wordpress image used by this project uses apache, but doesn't include
any SSL certificates. To work around this an extension to the WordPress container image is build (see wp/ directory)
with certificates installed based on the technique described by
https://github.com/ogierschelvis in PR https://github.com/docker-library/wordpress/issues/46#issuecomment-358266189

## Fixing data

The database dump placed in wp-data will contain references to the live https://www.morrisfed.org.uk website.

For development we want to modify that data to use references to localhost instead.

When the mysql container starts it will look for files in /docker-entrypoint-initdb.d, which is bind mounted from the
wp-data directory. Any .sh files are treated as scripts and sourced. Any .sql files are executed against the configured 
database.

A new script, 01-replace-urls.sh, has been added to wp-data to replace https://www.morrisfed.org.uk in any .sql
files with http://localhsot.

By prefixing the script with 01 we should ensure it is run before the .sql file is imported into the database.

## Morris Federation Theme

The Morris Federation theme for wordpress is in directory, morrisfed2021. This directory is bind mounted into the 
WordPress container and can be selected for use in the WordPress dashboard.

The theme is based on Genesis Sample and uses the Genesis Framework.