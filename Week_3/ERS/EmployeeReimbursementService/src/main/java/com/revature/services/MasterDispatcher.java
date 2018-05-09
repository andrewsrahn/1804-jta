package com.revature.services;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MasterDispatcher {
private MasterDispatcher() {
		
	}
	
	public static String process(HttpServletRequest request, HttpServletResponse responce) {
		switch(request.getRequestURI()) {
			
		case "/EmployeeReimbursementService/login.do": 
			return LoginService.login(request, responce);
		case "/EmployeeReimbursementService/managerHome.do": 
			return ManagerHomeService.home(request, responce);
		case "/EmployeeReimbursementService/employeeHome.do": 
			return EmployeeHomeService.home(request, responce);
			
			default: return "404.jsp";
		}
	}
}