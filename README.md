# phpunit-headless-selenium-chrome
Headless selenium chromedriver setup with PHPUnit examples

https://code.google.com/p/selenium/wiki/ChromeDriver shows you the location of Chrome on OSes, and gives links to download chromedriver (which you'll need)

* Run `selenium-chrome.sh` on your Vagrant box or server to automatically install dependencies, and run selenium
* If you want to run this locally then download selenium, chrome and chromedriver: `java -jar selenium-server-standalone-2.48.2.jar -log /tmp/selenium.log -Dwebdriver.chrome.bin=/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome -Dwebdriver/chrome.driver=/Users/ahindle/Downloads/chromedriver`
* Run PHPUnit: `vendor/bin/phpunit`
* Look at all that green
