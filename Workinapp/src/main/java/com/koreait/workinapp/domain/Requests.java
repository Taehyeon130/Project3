package com.koreait.workinapp.domain;

import java.util.List;

import lombok.Data;

@Data
public class Requests {
	private int req_pk;
	private int e_pk;
	private int sub_pk;
	private String req_date;
	private String req_note;
	private String req_master;
	private int req_status;
	
	
	//join
	private SubCategory subCategory; //부모정보 has a관계로 보유
	private TopCategory topCategory;
	private Employee employee;

}
