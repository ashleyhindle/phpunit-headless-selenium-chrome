#!/bin/sh
# Lovingly adapted from http://www.chrisle.me/2013/08/running-headless-selenium-with-chrome/

if [ -e /.installed ]; then
  echo 'Already installed.'
else
  echo ''
  echo 'INSTALLING'
  echo '----------'

  # Add Google public key to apt
  wget -q -O - "https://dl-ssl.google.com/linux/linux_signing_key.pub" | sudo apt-key add -

  # Add Google to the apt-get source list
  echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list

  # Update app-get
  apt-get update

  # Install Java, Chrome, Xvfb, and unzip
  apt-get -y install openjdk-7-jre google-chrome-stable xvfb unzip

  # Download and copy the ChromeDriver to /usr/local/bin
  cd /tmp
  wget "http://chromedriver.storage.googleapis.com/2.9/chromedriver_linux64.zip"
  wget "https://selenium.googlecode.com/files/selenium-server-standalone-2.35.0.jar"
  unzip chromedriver_linux64.zip
  mv chromedriver /usr/local/bin
  mv selenium-server-standalone-2.35.0.jar /usr/local/bin

  # So that running `vagrant provision` doesn't redownload everything
  touch /.installed
fi

killall -9 Xvfb # this is supposed to be capitalised, though I don't yet know why.
killall -9 google-chrome
killall -9 java

# Start Xvfb, Chrome, and Selenium in the background
export DISPLAY=:10
cd /vagrant

echo "Starting Xvfb ..."
# this is supposed to be capitalised, though I don't yet know why.
Xvfb :10 +extension RANDR -screen 0 1366x768x24 -ac  &

echo "Starting Selenium ..." # This runs on port 4444
cd /usr/local/bin
nohup java -jar ./selenium-server-standalone-2.35.0.jar -log /tmp/selenium.log -Dwebdriver.chrome.bin=/usr/bin/google-chrome -Dwebdriver.chrome.driver=/usr/local/bin/chromedriver &
