package com.koreait.workinapp.model.service.work;

import java.util.List;

import com.koreait.workinapp.domain.Work;

public interface WorkService {
	public void insert(Work work);
	public List selectAll();
	public List selectAllByApproval(); //승인 완료된 근무 일정
	public void update(Work work);
	public void delete(int w_pk);
	
	public List selectNo(int e_pk);
	public List selectOk(int e_pk);
	public List selectPk(int e_pk);
}
