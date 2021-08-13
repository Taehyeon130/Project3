package com.koreait.workinapp.model.repository.main;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.workinapp.domain.Employee;
import com.koreait.workinapp.exception.EmployeeExistException;

@Repository
public class MybatisEmployeeDAO implements EmployeeDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public Employee login(Employee employee) throws EmployeeExistException{
		Employee obj = sqlSessionTemplate.selectOne("Employee.login", employee);
		if(obj == null) {
			throw new EmployeeExistException("濡쒓렇�씤 �젙蹂닿� �삱諛붾Ⅴ吏� �븡�뒿�땲�떎");
		}
		return obj;
	}

	@Override
	public void regist(Employee employee) {
		sqlSessionTemplate.insert("Employee.join", employee);
		
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
		return sqlSessionTemplate.selectList("Employee.selectAll");
	}

	@Override
	public List selectManager() {
		return sqlSessionTemplate.selectList("Employee.selectManager");
		
	}

	@Override
	public void updateEmail(Employee employee) {
		sqlSessionTemplate.update("Employee.updateEmail",employee);
		
	}

	@Override
	public List selectEmployee() {
		return sqlSessionTemplate.selectList("Employee.selectEmployee");
	}

	@Override
	public Employee selectNow(int e_pk) {
		return sqlSessionTemplate.selectOne("Employee.selectNow",e_pk);
	}

}
