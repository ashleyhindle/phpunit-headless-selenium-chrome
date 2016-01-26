# phpunit-headless-selenium-chrome
Headless selenium chromedriver setup with PHPUnit example

# What to do

* Download http://selenium-release.storage.googleapis.com/2.48/selenium-server-standalone-2.48.2.jar
* **Follow your OS's info below**
* Open another terminal tab and run: `composer install; vendor/bin/phpunit`
* Look at all that green, yum!

## Mac

* Download http://chromedriver.storage.googleapis.com/2.20/chromedriver_mac32.zip and unzip
* Open a terminal and run: `java -jar ~/Downloads/selenium-server-standalone-2.48.2.jar -log /tmp/selenium.log -Dwebdriver.chrome.bin=/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome -Dwebdriver/chrome.driver=/Users/MYUSER/Downloads/chromedriver`

## Linux

* Download http://chromedriver.storage.googleapis.com/2.20/chromedriver_linux64.zip and unzip

* Open a terminal and run: `java -jar selenium-server-standalone-2.48.2.jar -log /tmp/selenium.log -Dwebdriver.chrome.bin=/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome -Dwebdriver/chrome.driver=/Users/ahindle/Downloads/chromedriver`

## Linux Server/Vagrant

* Run `selenium-chrome.sh` on your Vagrant box or server to automatically install all dependencies, and run selenium - this was tested on Ubuntu 14.04
* Run PHPUnit: `composer install; vendor/bin/phpunit`
* Look at all that green, oh yea!

## Windows

If you know how to run this on Windows, please let me know or create a pull request
