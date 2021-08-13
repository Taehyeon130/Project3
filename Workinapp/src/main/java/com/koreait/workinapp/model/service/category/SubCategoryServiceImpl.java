package com.koreait.workinapp.model.service.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.workinapp.model.repository.category.SubCategoryDAO;

@Service
public class SubCategoryServiceImpl implements SubCategoryService{
	@Autowired
	private SubCategoryDAO subCategoryDAO;
	
	
	@Override
	public List selectAllById(int topcategory_id) {
		return subCategoryDAO.selectAllById(topcategory_id);
	}
	
	@Override
	public List selectAll() {
		return subCategoryDAO.selectAll();
	}
}
