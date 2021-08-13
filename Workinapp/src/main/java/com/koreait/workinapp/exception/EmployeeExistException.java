package com.koreait.workinapp.exception;

public class EmployeeExistException extends RuntimeException {
	
	public EmployeeExistException(String msg) {
		super(msg);
	}
	
	public EmployeeExistException(Throwable e) {
		super(e);
	}
	
	public EmployeeExistException(String msg, Throwable e) {
		super(msg, e);
	}
}
