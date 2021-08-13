package com.koreait.workinapp.domain;

import java.util.List;

import lombok.Data;

@Data
public class TopCategory {
	private int top_pk;
	private String top_name;
	
	private List<SubCategory> subList;
}
