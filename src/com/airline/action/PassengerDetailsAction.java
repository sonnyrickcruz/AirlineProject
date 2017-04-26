package com.airline.action;

import org.apache.log4j.Logger;

public class PassengerDetailsAction extends BaseAction {
	private Logger log = Logger.getLogger(this.getClass());
	private String[] firstName;
	private String[] lastName;
	private String[] birthDate;
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

	public Logger getLog() {
		return log;
	}

	public void setLog(Logger log) {
		this.log = log;
	}

	public String[] getFirstName() {
		return firstName;
	}

	public void setFirstName(String[] firstName) {
		this.firstName = firstName;
	}

	public String[] getLastName() {
		return lastName;
	}

	public void setLastName(String[] lastName) {
		this.lastName = lastName;
	}

	public String[] getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String[] birthDate) {
		this.birthDate = birthDate;
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
