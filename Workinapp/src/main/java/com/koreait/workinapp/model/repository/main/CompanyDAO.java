package com.koreait.workinapp.model.repository.main;

import java.util.List;

import com.koreait.workinapp.domain.Company;

public interface CompanyDAO {
	
	public Company select(Company company);
	public List selectAll(); //회사 리스트
	public void insert(Company company); //회사 생성
	public void update(Company company); //회사 수정
	public void delete(Company company); //회사 삭제
}
