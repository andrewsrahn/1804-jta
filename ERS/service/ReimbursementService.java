package com.revature.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.revature.dao.ReimbursementDAO;
import com.revature.daoImpl.ReimbursementDaoImpl;
import com.revature.model.Employee;
import com.revature.model.Reimbursement;

public class ReimbursementService {
	private static final Logger logger = Logger.getLogger(ReimbursementService.class);

	private static ReimbursementDAO dao = new ReimbursementDaoImpl();
	
	private ReimbursementService() {}
	
	
	public static Reimbursement getReimbursement(int id) {
		return dao.getReimbursement(id);
	}
	
	public static boolean setReimbursement(Employee rbmt) {
		return dao.setReimbursement(rbmt);
	}
	
	public static boolean UpdateReimbursement(int rbmt,Employee emp) {
		return dao.UpdateReimbursement(rbmt, emp);
	}
	
	public static List<Reimbursement> getMyReimbursements(Employee emp) {
		return dao.getEmployeeReimbursement(emp);
	}
	
	public static List<Reimbursement> getAllReimbursements(Employee emp){
		return dao.ManagerFetch(emp);
	}
	
	public static String NewReimbursement(HttpServletRequest request, HttpServletResponse response) {
		String amount = request.getParameter("amount");
		String category = request.getParameter("category");
		Employee user = (Employee) request.getSession().getAttribute("Employee");
		Reimbursement entry = new Reimbursement();
		entry.setAmount(Float.parseFloat(amount));
		entry.setCategory(category);
		entry.setE_id(user.getId());
		if(setReimbursement(user)) {
			ReimbursementInformationService.newInformation(entry);
			logger.info("New reimbursement request created");
		}
		String page = (user.getTitle().equals("Financial Manager")) ?
				"/HTML/ManagerReimbursement.jsp" : "/HTML/EmployeeReimbursement.jsp";
		return page;
	}
	
}
