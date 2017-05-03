package com.airline.action;

import java.util.List;

import org.apache.log4j.Logger;

import com.airline.bean.PassengerBean;
import com.airline.bean.PaxBean;
import com.airline.bean.TicketBean;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class PassengerDetailsAction extends BaseAction {
	private Logger log = Logger.getLogger(this.getClass());
	private int step = 3;
	private String message;
	
	/**
	 * displays the passenger details input
	 * 
	 * @param result
	 */
	public String execute() {
		log.debug("start action");
		String result = input;
		
		session.put("step", step);
		
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
		Gson gson = new Gson();
		try {
			TicketBean ticket = (TicketBean) session.get("ticket");
			List<PaxBean> pax = ticket.getPassengers();
			List<PassengerBean> passengers = gson.fromJson(message, new TypeToken<List<PassengerBean>>(){}.getType());
			for (int i = 0; i < passengers.size(); i++) {
				pax.get(i).setPassenger(passengers.get(i));
			}
			ticket.setPassengers(pax);
			session.put("ticket", ticket);
			log.debug("end action - result: " + result);
		} catch (Exception e) {
			log.error(e);
		}
		return result;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
