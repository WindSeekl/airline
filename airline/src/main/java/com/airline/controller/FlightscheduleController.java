package com.airline.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.airline.domain.Company;
import com.airline.domain.Customer;
import com.airline.domain.Flight;
import com.airline.domain.Flightschedule;
import com.airline.domain.Planemodel;
import com.airline.service.CompanyService;
import com.airline.service.CustomerService;
import com.airline.service.FlightService;
import com.airline.service.FlightscheduleService;
import com.airline.service.PlanemodelService;
import com.airline.service.ReserveService;
import com.airline.service.ScheduleInfoService;

import net.sf.json.JSONObject;
@RestController
public class FlightscheduleController {
	@Autowired
	private FlightscheduleService flightscheduleService;
	@Autowired
	private ScheduleInfoService scheduleInfoService;
	@Autowired
	private FlightService flightService;
	@Autowired
	private PlanemodelService planemodelService;
	@Autowired
	private ReserveService reserveService;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private CompanyService companyService;
	@RequestMapping("insertFlightschedule")
	public JSONObject insertFlight(Flightschedule flightschedule) {
		Map<String, String> map = new HashMap<String, String>();
		String res = flightscheduleService.insertFlightschedule(flightschedule);
		map.put("res", res);
		JSONObject json = JSONObject.fromObject(map);
		return json;
	}
	@RequestMapping("queryFlightschedule")
	public ModelAndView queryFlightschedule(Flightschedule flightschedule) {
		ModelAndView mv = new ModelAndView("flight/flightshow");
		int flightscheduleId = flightscheduleService.queryOneFlightschedule(flightschedule);
		flightschedule.setFlightscheduleId(flightscheduleId);
		List<Flight> accordFlightList = scheduleInfoService.queryScheduleAllFlight(flightschedule);
		mv.addObject("flightschedule", flightschedule);
		mv.addObject("size", accordFlightList.size());
		mv.addObject("accordFlightList", accordFlightList);
		return mv; 
	}
	@RequestMapping("querySurplus")
	public ModelAndView querySurplus(HttpSession session,String flightNo,String travelDate,String fsDate) {
		ModelAndView mv = new ModelAndView("flight/flight");
		Flight flight = flightService.queryFlightOne(flightNo);
		flight.setTravelDate(travelDate);
		session.setAttribute("fsDate",fsDate);
		session.setAttribute("flight",flight);
		Planemodel planemodel = planemodelService.queryPlanemodelOne(flight.getPlanemodelName());
		int Yseat = Integer.parseInt(planemodel.getFnumber())-reserveService.querySeatNum("Y");
		int Bseat = Integer.parseInt(planemodel.getBnumber())-reserveService.querySeatNum("B");
		int Eseat = Integer.parseInt(planemodel.getEnumber())-reserveService.querySeatNum("e");
		mv.addObject("Yseat", Yseat);
		mv.addObject("Bseat", Bseat);
		mv.addObject("Eseat", Eseat);
		mv.addObject("planemodel", planemodel);
		return mv; 
	}
	
	@RequestMapping("fillOrder")
	public ModelAndView fillOrder(HttpSession session,int price,String seatId) {
		ModelAndView mv = new ModelAndView();
		Flight flight=(Flight) session.getAttribute("flight");
		Company company = companyService.queryCompanyByName(flight.getCompanyName());
		String customerName = (String) session.getAttribute("customer");
		if(customerName==null) {
			mv.setViewName("login");
		}else {
			Customer customer = customerService.loginInfo(customerName);
			mv.addObject("price", price);
			int integral = customer.getIntegral();
			String discountInfo;
			double discount = 1;
			String VIPgrade = null;
			if(integral<5000) {
				VIPgrade="普通用户";
				discountInfo = "无折扣";
			}else {
				if(integral>=5000&&integral<10000){
					VIPgrade="铜牌用户";
					discount = company.getCopper();
				}else if(integral>=10000&&integral<80000){
					VIPgrade="银牌用户";
					discount = company.getSilver();
				}else if(integral>=80000){
					VIPgrade="金牌用户";
					discount = company.getGold();
				}
				discountInfo = discount*10+"折";
			}
			price *= discount;
			mv.addObject("VIPgrade", VIPgrade);
			mv.addObject("discountInfo", discountInfo);
			session.setAttribute("discountPrice",price);
			session.setAttribute("seatId",seatId);
			mv.setViewName("flight/bookingflight");
		}
		return mv; 
	}
}
