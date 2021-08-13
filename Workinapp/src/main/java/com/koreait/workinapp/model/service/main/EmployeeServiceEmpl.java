package com.koreait.workinapp.model.service.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.workinapp.domain.Employee;
import com.koreait.workinapp.model.repository.main.EmployeeDAO;

@Service
public class EmployeeServiceEmpl implements EmployeeService{

	@Autowired
	private EmployeeDAO employeeDAO;
	
	@Override
	public Employee login(Employee employee) {
		return employeeDAO.login(employee);
	}

	@Override
	public void regist(Employee employee) {
		employeeDAO.regist(employee);
		
	}

	@Override
	public void update(Employee employee) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Employee employee) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List selectAll() {
		return employeeDAO.selectAll();
	}

	@Override
	public List selectManager() {
		return employeeDAO.selectManager();
	}

	@Override
	public void updateEmail(Employee employee) {
		employeeDAO.updateEmail(employee);
		
	}

	@Override
	public List selectEmployee() {
		return employeeDAO.selectEmployee();
	}

	@Override
	public Employee selectNow(int e_pk) {
		return employeeDAO.selectNow(e_pk);
	}

}
