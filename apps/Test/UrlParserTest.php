<?php
	class UrlParserTest extends \PHPUnit_Framework_TestCase
	{
		public function testForValidParameterCounts(){
			$objUrl = new UrlParser('https://www.google.com/#q=test', 'http://test.com');
			$this->assertCount(
					1, $objUrl->getMergedArrayFromURLs() 
			);
		}
		
		public function testForFailureArrayCheck(){
			$objUrl = new UrlParser('https://www.google.com/#q=test', 'http://test.com');
			$this->assertEmpty(
					$objUrl->getMergedArrayFromURLs()
			);
		}
	}	