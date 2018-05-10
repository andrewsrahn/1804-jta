package daoimpl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.apache.log4j.Logger;

import dao.EmployeeDao;
import designpattern.ConnectionUtil;
import designpattern.PersonFactory;
import model.Employee;

public class EmployeeDaoImpl implements EmployeeDao {
	private Logger logger;
	
	public EmployeeDaoImpl(Logger logger) {
		super();
		this.logger = logger;
	}

	@Override
	public boolean createEmployee(String inUsername, String inPassword) {
		String sql = "{call create_employee(?,?)}";
		try(Connection c = ConnectionUtil.connect(this.logger);
				CallableStatement s = c.prepareCall(sql);){
			s.setString(1, inUsername);
			s.setString(2, inPassword);
			return s.executeUpdate() > 0;
		} catch(SQLException e) {
			logger.error(e.getSQLState());
			logger.error(e.getErrorCode());
			logger.error(e.getMessage());
			return false;
		}
	}

	@Override
	public Employee readEmployee(String inUsernamee) {
		String sql = "SELECT * FROM employee WHERE username=?";
		try(Connection c = ConnectionUtil.connect(this.logger);
				PreparedStatement s = c.prepareStatement(sql);){
			s.setString(1, inUsernamee);
			ResultSet r = s.executeQuery();
			while(r.next()) {
				int inEmployeeid = r.getInt(1);
				int inManagerid = r.getInt(2);
				String inUsername = r.getString(3);
				String inPassword = r.getString(4);
				return (Employee)
						PersonFactory.create("employee", inEmployeeid, inManagerid, inUsername, inPassword);
			}
		} catch(SQLException e) {
			logger.error(e.getSQLState());
			logger.error(e.getErrorCode());
			logger.error(e.getMessage());
		}
		return null;
	}

	@Override
	public boolean updateEmployee(String inManagerUsername, String inUsername, String inPassword) {
		String sql = "{call update_employee(?,?,?)}";
		try(Connection c = ConnectionUtil.connect(this.logger);
				CallableStatement s = c.prepareCall(sql);){
			s.setString(1, inManagerUsername);
			s.setString(2, inUsername);
			s.setString(3, inPassword);
			return s.executeUpdate() > 0;
		} catch(SQLException e) {
			logger.error(e.getSQLState());
			logger.error(e.getErrorCode());
			logger.error(e.getMessage());
			return false;
		}
	}

	@Override
	public boolean deleteEmployee(String inUsername) {
		String sql = "{call delete_employee(?)}";
		try(Connection c = ConnectionUtil.connect(logger);
				CallableStatement s = c.prepareCall(sql);){
			s.setString(1, inUsername);
			return s.executeUpdate() > 0;
		} catch(SQLException e) {
			logger.error(e.getSQLState());
			logger.error(e.getErrorCode());
			logger.error(e.getMessage());
			return false;
		}
	}
}