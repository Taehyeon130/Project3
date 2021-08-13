package com.koreait.workinapp.model.repository.category;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MybatisCategoryDAO implements CategoryDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("DayoffCategory.selectAll");
	}

}
