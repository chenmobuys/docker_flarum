CREATE DATABASE `flarum`;

CREATE USER 'flarum'@'%' IDENTIFIED BY 'flarum';

GRANT ALL on *.* TO 'flarum'@'%' IDENTIFIED BY 'flarum';

FLUSH PRIVILEGES;
