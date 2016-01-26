<?php

class SeleniumTests extends PHPUnit_Extensions_Selenium2TestCase {

    public function setUp() {
        $this->setHost('localhost');
        $this->setPort(4444);

        $this->setBrowser('chrome');
        $this->setBrowserUrl('https://www.google.com');
    }

    public function tearDown()
    {
        $this->closeWindow(); // This sometimes causes issues.  The class says we should have the 'close' method
    }

    public function testGoogleSearchButtonExists() {
        $this->url('/');

        $this->assertContains('Google Search', $this->source());
    }

    public function testCanSearch() {
        $this->url('/');

	$inputElement = $this->byName('q');
	$this->keys('Cheese Burger');
	$inputElement->submit();

	$that = $this;

	// Wait until the AJAX loads the results (as we submitted the search form just above, so our chrome is currently AJAXing the results)
	$this->waitUntil(function() use($that) {
		return $that->byId('resultStats');
	}, 5000);

        $this->assertContains('McDonalds', $this->source()); // This is a dreadful test :)
    }

}
