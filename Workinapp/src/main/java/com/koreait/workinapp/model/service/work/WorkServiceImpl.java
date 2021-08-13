package com.koreait.workinapp.model.service.work;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.workinapp.domain.Work;
import com.koreait.workinapp.model.repository.work.WorkDAO;

@Service
public class WorkServiceImpl implements WorkService{
	@Autowired
	private WorkDAO workDAO;
	
	
	@Override
	public void insert(Work work) {
		workDAO.insert(work);
	}
	@Override
	public List selectAll() {
		return workDAO.selectAll();
	}
	
	@Override
	public List selectAllByApproval() {
		return workDAO.selectAllByApproval();
	}

	@Override
	public void update(Work work) {
		workDAO.update(work);
	}

	@Override
	public void delete(int w_pk) {
		workDAO.delete(w_pk);
	}
	@Override
	public List selectNo(int e_pk) {
		return workDAO.selectNo(e_pk);
	}
	@Override
	public List selectOk(int e_pk) {
		return workDAO.selectOk(e_pk);
	}
	@Override
	public List selectPk(int e_pk) {
		return workDAO.selectPk(e_pk);
	}

}
