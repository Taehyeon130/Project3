package com.koreait.workinapp.model.repository.work;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.workinapp.domain.Work;

@Repository
public class MybatisWorkDAO implements WorkDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//근로 등록하기
	@Override
	public void insert(Work work) {
		sqlSessionTemplate.insert("Work.insertWork",work);
	}
	
	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("Work.selectAll");
	}
	
	@Override
	public List selectAllByApproval() {
		return sqlSessionTemplate.selectList("Work.selectAllByApproval");
	}

	@Override
	public void update(Work work) {
		int result = sqlSessionTemplate.update("Work.update", work);
		
	}

	@Override
	public void delete(int w_pk) {
		int result = sqlSessionTemplate.delete("Work.delete", w_pk);
	}

	@Override
	public List selectNo(int e_pk) {
		return sqlSessionTemplate.selectList("Work.selectNo",e_pk);
	}

	@Override
	public List selectOk(int e_pk) {
		return sqlSessionTemplate.selectList("Work.selectOk",e_pk);
	}

	@Override
	public List selectPk(int e_pk) {
		return sqlSessionTemplate.selectList("Work.selectPk",e_pk);
	}

}
