package daoimpltest;

import static org.junit.Assert.assertTrue;

import org.apache.log4j.Logger;
import org.junit.BeforeClass;
import org.junit.Test;

import daoimpl.EmployeeDaoImpl;
import daoimpl.ManagerDaoImpl;

public class EmployeeDaoImplTest {
	static Logger logger;
	static EmployeeDaoImpl employeeDao;
	static ManagerDaoImpl managerDao;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		logger = Logger.getLogger(EmployeeDaoImpl.class);
		employeeDao = new EmployeeDaoImpl(logger);	
		managerDao = new ManagerDaoImpl(logger);		
	}

	@Test
	public void testCreateEmployee() {
		boolean result = employeeDao.createEmployee("william", "gentry");
		assertTrue(result);
		employeeDao.deleteEmployee("william");
	}

	@Test
	public void testReadEmployee() {
		boolean result = employeeDao.createEmployee("andrew", "password");
		assertTrue(result);
		employeeDao.deleteEmployee("andrew");
	}

	@Test
	public void testUpdateEmployee() {
		employeeDao.createEmployee("andrew", "password");
		managerDao.createManager("andrew");
		
		boolean result = employeeDao.updateEmployee("andrew", "andrew", "password");
		assertTrue(result);
		
		managerDao.deleteManager("andrew");
		employeeDao.deleteEmployee("andrew");
	}

	@Test
	public void testDeleteEmployee() {
		employeeDao.createEmployee("andrew", "password");
		boolean result = employeeDao.deleteEmployee("andrew");
		assertTrue(result);
	}	
}
