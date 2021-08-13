package com.koreait.workinapp.model.repository.main;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.workinapp.domain.Company;
import com.koreait.workinapp.exception.EmployeeExistException;

@Repository
public class MybatisCompanyDAO implements CompanyDAO{

	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public Company select(Company company) throws EmployeeExistException{
		Company obj = sqlSessionTemplate.selectOne("Company.select", company);
		if(obj==null) {
			throw new EmployeeExistException("코드가 올바르지 않습니다");
		}
		return obj;
	}
	
	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("Company.selectAll");
	}

	@Override
	public void insert(Company company) {
		sqlSessionTemplate.insert("Company.insert", company);
	}

	@Override
	public void update(Company company) {
		sqlSessionTemplate.update("Company.update", company);
	}

	@Override
	public void delete(Company company) {
		// TODO Auto-generated method stub
		
	}
}
