<?php
	/**
	 * PhoneNumber class for performing Phone Formatting operations
	 */
	class PhoneNumber {
		/**
         * Variable to carry Phone number throughout class operations 
		 * @access private
         * @var String
         */
		private $number;
		
		/**
         * The class constructor
		 * Assigns value for phone number if valid format
         */
		public function __construct($number){
			if($this->isValid($number)){
				$this->setNumber($number);
			}
		}
		
		/**
	     * Set the Phone Number var
	     *
	     * @param string $number
	     */
		private function setNumber($number){
			$this->number = $number;
		}
		
		/**
	     * Function to get Phone Number
	     *
	     * This function returns {@link $number}
	     * 
	     * @see setNumber(), $number
	     * @return string
	     */
		public function getNumber(){
			return $this->number;
		}
		
		/**
	     * Function to check valid 10 digit Phone Number
	     *
	     * This function returns boolean Or throws an exception
		 * @return boolean
	     */
		private function isValid($number){
			try{
				if(empty($number)){
					throw new Exception('Input number cannot be empty');
				} else {
					if(preg_match("/^[0-9]{10}$/",$number)){
						return true;
					} else {
						throw new Exception('Invalid Number');
					}
				}				
			} catch(Exception $e){
				echo ($e->getMessage());
			}			
		}
		
		/**
	     * Function to get formatted Phone Number xxx-xxx-xxxx
	     * 
	     * @see setNumber(), $number
	     * @return string
	     */
		public function getFormatted(){		
			return preg_replace("/^(\d{3})(\d{3})(\d{4})$/", "$1-$2-$3", $this->getNumber());
		}
	}