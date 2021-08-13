package com.koreait.workinapp.model.service.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.workinapp.model.repository.category.CategoryDAO;

@Service
public class CategoryServiceImpl implements CategoryService{
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Override
	public List selectAll() {
		return categoryDAO.selectAll();
	}

}
