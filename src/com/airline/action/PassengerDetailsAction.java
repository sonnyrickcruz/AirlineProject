package com.airline.action;

import org.apache.log4j.Logger;

public class PassengerDetailsAction extends BaseAction {
	private Logger log = Logger.getLogger(this.getClass());
	/**
	 * displays the passenger details input
	 * 
	 * @param result
	 */
	public String execute() {
		log.debug("start action");
		String result = input;
		
		log.debug("end action - result: " + result);
		return result;
	}

	/**
	 * description
	 * 
	 * @param result
	 */
	public String executeSubmit() {
		log.debug("start action");
		String result = input;

		
		log.debug("end action - result: " + result);
		return result;
	}
}
