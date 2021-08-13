package com.koreait.workinapp.model.service.main;

import java.util.List;

import com.koreait.workinapp.domain.Company;

public interface CompanyService {
	
	public Company select(Company company);
	public List selectAll();
	public void insert(Company company);
	public void update(Company company);
	public void delete(Company company);
}
