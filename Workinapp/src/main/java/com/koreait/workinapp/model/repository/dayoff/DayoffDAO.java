package com.koreait.workinapp.model.repository.dayoff;

import java.util.List;

import com.koreait.workinapp.domain.Dayoff;
import com.koreait.workinapp.domain.Employee;

public interface DayoffDAO {
	public List  selectAllDayoff(); //전 사원의 휴가 리스트 
	public void insertDayoff(Dayoff dayoff);//휴가 요청
	
	public List selectAll();
	public List selectAllByApproval(); //승인 완료된 근무 일정
	public void update(Dayoff dayoff);
	public void delete(int d_pk);
	
	public List select(int e_pk); //특정사원 & 미승인
	public List selectOk(int e_pk); //특정사원 & 승인
	public List selectAllNow(int e_pk); //특정사원 모든 휴가

}
