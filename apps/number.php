<?php 
	require_once('lib/PhoneNumber.php');
	
	$phoneNumber = '9965875a25';	
	try{
		$objPhoneNumber = new PhoneNumber($phoneNumber);		
		echo $objPhoneNumber->getFormatted();		
	} catch(Exception $e){
		echo ($e->getMessage());
	}