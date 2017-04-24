package com.airline.manager;

import java.util.List;

import org.apache.log4j.Logger;

import com.airline.bean.FlightBean;
import com.airline.dao.SelectFlightDao;
import com.airline.exception.BusinessException;
import com.airline.exception.ConnectionException;
import com.airline.exception.SystemException;

public class SelectFlightsManager {
	private Logger log = Logger.getLogger(this.getClass());

	/**
	 * Process Flight List
	 * 
	 * @param sampleParam
	 * @return sampleList
	 * @throws BusinessException
	 * @throws SystemException
	 * @throws ConnectionException
	 */
	public List<FlightBean> retrieveFlightsByDateRouteId(String departureDate, String routeId)
			throws BusinessException, SystemException, ConnectionException {
		log.debug("start - departureDate: " + departureDate + " routeId: " + routeId);

		List<FlightBean> flightList = null;

		SelectFlightDao selectFlightDao = new SelectFlightDao();
		try {
			flightList = selectFlightDao.retrieveFlightsByDateRouteId(departureDate, routeId);
		} catch (ConnectionException e) {
			throw e;
		} catch (SystemException e) {
			throw e;
		} catch (Exception e) {
			log.error("There was an unknown error while processing flight list. " + e);
			throw new BusinessException(e);
		}

		log.debug("end flightListSize: " + flightList.size());
		return flightList;
	}
	
	public void retrieveFlightById(FlightBean flight, String id) throws ConnectionException, SystemException, BusinessException {
		log.debug("START - retrieveFlightById id: " + id);
		SelectFlightDao selectFlightDao = new SelectFlightDao();
		try {
			selectFlightDao.getFlightById(flight, id);
		} catch (SystemException | ConnectionException e) {
			throw e;
		} catch (Exception e) {
			log.error("There was an unknown error while processing flight. " + e);
			throw new BusinessException(e);
		}
		
		log.debug("END - retrieveFlightById");
	}
}
