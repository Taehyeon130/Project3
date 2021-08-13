package com.koreait.workinapp.model.service.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.workinapp.domain.Company;
import com.koreait.workinapp.domain.Employee;
import com.koreait.workinapp.model.repository.main.CompanyDAO;

@Service
public class CompanyServiceImpl implements CompanyService{

	@Autowired
	private CompanyDAO companyDAO;
	
	@Override
	public Company select(Company company) {
		Company obj = companyDAO.select(company);
		
		return obj;
	}

	@Override
	public List selectAll() {
		return companyDAO.selectAll();
	}

	@Override
	public void insert(Company company) {
		companyDAO.insert(company);
	}

	@Override
	public void update(Company company) {
		companyDAO.update(company);

	}

	@Override
	public void delete(Company company) {
		// TODO Auto-generated method stub
		
	}
}
