package com.koreait.workinapp.model.repository.dayoff;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.workinapp.domain.Dayoff;
import com.koreait.workinapp.domain.Employee;

@Repository
public class MybatisDayoffDAO implements DayoffDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectAllDayoff() {
		return sqlSessionTemplate.selectList("Dayoff.selectAllDayoff");
	}

	@Override
	public void insertDayoff(Dayoff dayoff) {
		sqlSessionTemplate.insert("Dayoff.insertDayoff", dayoff);
	}
	
	public List selectAll() {
		return sqlSessionTemplate.selectList("Dayoff.selectAll");
	}

	@Override
	public List selectAllByApproval() {
		return sqlSessionTemplate.selectList("Dayoff.selectAllByApproval");
	}

	@Override
	public void update(Dayoff dayoff) {
		int result = sqlSessionTemplate.update("Dayoff.update", dayoff);
	}

	@Override
	public void delete(int d_pk) {
		int result = sqlSessionTemplate.delete("Dayoff.delete", d_pk);
	}

	
	  @Override 
	  public List select(int e_pk) { 
		  return sqlSessionTemplate.selectList("Dayoff.select",e_pk); 
	}

	@Override
	public List selectOk(int e_pk) {
		return sqlSessionTemplate.selectList("Dayoff.selectOk",e_pk);
	}

	@Override
	public List selectAllNow(int e_pk) {
		return sqlSessionTemplate.selectList("Dayoff.selectAllNow",e_pk);
	}
	 
}
