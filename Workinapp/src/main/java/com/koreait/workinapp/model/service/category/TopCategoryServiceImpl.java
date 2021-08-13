package com.koreait.workinapp.model.service.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.workinapp.model.repository.category.TopCategoryDAO;

@Service
public class TopCategoryServiceImpl implements TopCategoryService{

	@Autowired
	private TopCategoryDAO topCategoryDAO;
	
	@Override
	public List selectAll() {
		return topCategoryDAO.selectAll();
	}

	@Override
	public List selectByWork() {

		return topCategoryDAO.selectByWork();
	}

}
