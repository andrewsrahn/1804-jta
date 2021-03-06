package com.revature.driver;

public class DriverNotFoundException extends RuntimeException {

	private static final long serialVersionUID = 1L;
	public DriverNotFoundException() {
		super();
	}
	
	public DriverNotFoundException(String message) {
		super(message);
	}
	
	public DriverNotFoundException(String message, Throwable cause) {
		super(message, cause);
	}
}
