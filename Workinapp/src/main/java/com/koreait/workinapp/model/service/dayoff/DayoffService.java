package com.koreait.workinapp.model.service.dayoff;

import java.util.List;

import com.koreait.workinapp.domain.Dayoff;
import com.koreait.workinapp.domain.Employee;

public interface DayoffService {
	public List selectAllDayoff();
	public void insertDayoff(Dayoff dayoff);//휴가 요청
	public List selectAll();
	public List selectAllByApproval(); //승인 완료된 근무 일정
	public void update(Dayoff dayoff);
	public void delete(int d_pk);
	public List select(int e_pk);
	public List selectOk(int e_pk); //특정사원 & 승인
	public List selectAllNow(int e_pk); //특정사원 모든 휴가

}
