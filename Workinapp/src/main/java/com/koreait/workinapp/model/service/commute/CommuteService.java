package com.koreait.workinapp.model.service.commute;

import java.util.List;

import com.koreait.workinapp.domain.Commute;

public interface CommuteService {
	public void insert(Commute commute);
	public void out(Commute commute);
	public List selectAll();
	public List selectByEmployee(int e_pk);
}
