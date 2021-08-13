package com.koreait.workinapp.model.service.dayoff;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.workinapp.domain.Dayoff;
import com.koreait.workinapp.domain.Employee;
import com.koreait.workinapp.model.repository.dayoff.DayoffDAO;

@Service
public class DayoffServiceImpl implements DayoffService {
	@Autowired
	private DayoffDAO dayoffDAO;

	@Override
	public List selectAllDayoff() {
		return dayoffDAO.selectAllDayoff();
	}

	@Override
	public void insertDayoff(Dayoff dayoff) {
		dayoffDAO.insertDayoff(dayoff);
	}

	@Override
	public List selectAll() {
		return dayoffDAO.selectAll();
	}

	@Override
	public List selectAllByApproval() {
		return dayoffDAO.selectAllByApproval();
	}

	public void update(Dayoff dayoff) {
		dayoffDAO.update(dayoff);
	}

	@Override
	public void delete(int d_pk) {
		dayoffDAO.delete(d_pk);
	}

	
	@Override
	public List select(int e_pk) {
		return dayoffDAO.select(e_pk);
	}

	@Override
	public List selectOk(int e_pk) {
		return dayoffDAO.selectOk(e_pk);
	}

	@Override
	public List selectAllNow(int e_pk) {
		return dayoffDAO.selectAllNow(e_pk);
	}
	 

}
