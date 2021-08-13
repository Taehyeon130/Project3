package com.koreait.workinapp.domain;

import java.util.List;

import lombok.Data;

@Data
public class SubCategory {
	private int sub_pk;
	private int top_pk;
	private String sub_name;
	
	//조인
	private List<Requests> reqList;
	
}
