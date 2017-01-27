<?php
	require_once('lib/Urlparser.php');
	
	$strPrimaryURL = 'https://www.google.com/#q=indian+string+instrument';
	$strSecondaryURL = 'https://claim.phoneclaim.com/vzw/iweb/#/claim?carrierCode=Verizon&UserAction=New&Culture=en-US&icid=in-vzwclaim';
	
	try{
		$objUrlParser = new UrlParser($strPrimaryURL, $strSecondaryURL);
		$arrResult = $objUrlparser->getMergedArrayFromURLs();
		
		print_r($arrResult);
	} catch (Exception $e){
		echo ($e->getMessage());
	}	