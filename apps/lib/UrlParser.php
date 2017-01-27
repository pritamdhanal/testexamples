<?php
	/**
	 * Urlparser class for Parsing URL data and prepare array of query strings parameters
	 */
	class UrlParser {
		/**
         * Variable to carry Primary URL throughout class operations 
		 * @access private
         * @var String
         */
		private $urlPrimary;
		
		/**
         * Variable to carry Secondary URL throughout class operations 
		 * @access private
         * @var String
         */
		private $urlSecondary;
		
		/**
         * The class constructor
		 * Assigns value for Primary and Secondary URLs to access using get/set
         */
		public function __construct($primaryURL, $secondaryURL){
			$this->setPrimary($primaryURL);
			$this->setSecondary($secondaryURL);
		}
		
		/**
	     * Set the Primary URL var
	     *
	     * @param string $primaryURL
	     */
		private function setPrimary($primaryURL){
			$this->urlPrimary = $primaryURL;
		}
		
		/**
	     * Function to get Primary URl
	     *
	     * This function returns {@link $urlPrimary}
	     * 
	     * @see setPrimary(), $primaryURL
	     * @return string
	     */
		public function getPrimary(){
			return $this->urlPrimary;
		}
		
		/**
	     * Set the Secondary URL var
	     *
	     * @param string $secondaryURL
	     */
		private function setSecondary($secondaryURL){
			$this->urlSecondary = $secondaryURL;
		}
		
		/**
	     * Function to get Secondary URl
	     *
	     * This function returns {@link $urlSecondary}
	     * 
	     * @see setSecondary(), $secondaryURL
	     * @return string
	     */
		public function getSecondary(){
			return $this->urlSecondary;
		}
		
		/**
	     * Function to get Parsed URl
	     *
	     * This function returns {@link $arrParsedURL}
	     * 
	     * @return Array
	     */
		public function getParsedUrl($strUrl){
			$arrParsedURL = array();
			$arrParseUrl = parse_url($strUrl);
			if(!empty($arrParseUrl)){
				$arrParsedURL = $this->checkDataToParse($arrParseUrl); 
			}
			return $arrParsedURL;
		}
		
		/**
	     * Function to get Parsed query string data
	     *
	     * This function returns {@link $arrOutPut}
	     * 
	     * @return Array
	     */
		public function getParsedSting($strQueryFragments){ 
			parse_str($strQueryFragments, $arrOutPut); 
			return $arrOutPut;
		}
		
		/**
	     * Function performs operation on query string and share string to getParsedSting method 
	     *
	     * This function returns {@link $arrParsedData}
	     * 
	     * @return Array
	     */		
		public function checkDataToParse($arrUrlData){
			$arrParsedData = array();
			if(isset($arrUrlData['query'])){ 
				$arrParsedData = $this->getParsedSting($arrUrlData['query']);
			} elseif(isset($arrUrlData['fragment'])){ 
				$arrExplodeFragment = explode('?', $arrUrlData['fragment']);
				$strFragments = (count($arrExplodeFragment) > 1) ? $arrExplodeFragment[1] : $arrExplodeFragment[0];
				$arrParsedData = $this->getParsedSting($strFragments);
			}
			return $arrParsedData;
		}
		
		/**
	     * Function sends URLs to getParsedUrl method to get associative array of key=>value pair
	     *
	     * This function returns {@link $resultArray}
	     * 
	     * @return Array
	     */
		public function getMergedArrayFromURLs(){ 
			$arrPrimaryUrlParameters = $this->getParsedUrl($this->getPrimary()); 
			$arrSecondaryUrlParameters = $this->getParsedUrl($this->getSecondary());
			$resultArray = array_merge($arrPrimaryUrlParameters, $arrSecondaryUrlParameters);
			return $resultArray;
		}
	}