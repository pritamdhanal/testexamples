<?php
	class PhoneNumberTest extends \PHPUnit_Framework_TestCase
	{
		public function testForValidPhoneNumber(){
			$objPhone = new PhoneNumber('3265986532');
			$this->assertEquals(
					$objPhone->getNumber(), '3265986532'
			);
		}
		
		public function testForInvalidPhoneNumber(){
			$objPhone = new PhoneNumber('326598aaa');
			$this->assertEquals(
					$objPhone->getNumber(), false
			);
		}
		
		public function testForFormattedPhoneNumber(){
			$objPhone = new PhoneNumber('2326598256');
			$this->assertEquals(
					$objPhone->getFormatted(), '232-659-8256'
			);
		}
	}	