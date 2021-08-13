package com.koreait.workinapp.domain;

import lombok.Data;

@Data
public class Dayoff {
	private int d_pk;
	private int c_pk; //회사
	private int e_pk; //직원
	private int dc_pk; //카테고리
	
	private String d_name;
	private String d_note;
	private String d_master;
	private int d_status;
	private String d_date;
	
}
