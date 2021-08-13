package com.koreait.workinapp.model.repository.category;

import java.util.List;

public interface SubCategoryDAO {
	public List selectAllById(int top_pk);
	public List selectAll();
}
