package com.koreait.workinapp.model.service.main;

import java.util.List;

import com.koreait.workinapp.domain.Employee;

public interface EmployeeService {
	public Employee login(Employee employee); //로그인
	public void regist(Employee employee); //회원가입
	public void update(Employee employee); //수정
	public void delete(Employee employee); //삭제
	public List selectAll();
	public List selectManager();
	public List selectEmployee();//직원 리스트
	
	public Employee selectNow(int e_pk);
	public void updateEmail(Employee employee);
}
