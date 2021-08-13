package com.koreait.workinapp.model.repository.commute;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.workinapp.domain.Commute;

@Repository
public class MybatisCommuteDAO implements CommuteDAO{
		
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void insert(Commute commute) {
		sqlSessionTemplate.insert("Commute.insert",commute);
	}

	@Override
	public void out(Commute commute) {
		sqlSessionTemplate.insert("Commute.out",commute);
		
	}

	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("Commute.selectAll");
	}

	@Override
	public List selectByEmployee(int e_pk) {
		return sqlSessionTemplate.selectList("Commute.selectByEmployee",e_pk);
	}

}
