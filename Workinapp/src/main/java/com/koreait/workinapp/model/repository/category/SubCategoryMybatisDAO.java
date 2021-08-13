package com.koreait.workinapp.model.repository.category;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SubCategoryMybatisDAO implements SubCategoryDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectAllById(int top_pk) {
		return sqlSessionTemplate.selectList("SubCategory.selectAllById", top_pk);
	}
	
	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("SubCategory.selectAll");
	}

}
