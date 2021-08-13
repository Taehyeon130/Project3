package com.koreait.workinapp.model.service.commute;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.workinapp.domain.Commute;
import com.koreait.workinapp.model.repository.commute.CommuteDAO;

@Service
public class CommuteServiceImpl implements CommuteService{

	@Autowired
	private CommuteDAO commuteDAO;
	
	@Override
	public void insert(Commute commute) {
		commuteDAO.insert(commute);
		
	}

	@Override
	public void out(Commute commute) {
		commuteDAO.out(commute);
	}

	@Override
	public List selectAll() {
		return commuteDAO.selectAll();
	}

	@Override
	public List selectByEmployee(int e_pk) {
		return commuteDAO.selectByEmployee(e_pk);
	}

}
