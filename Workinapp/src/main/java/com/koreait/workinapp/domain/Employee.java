package com.koreait.workinapp.domain;

import lombok.Data;

@Data
public class Employee {
	private int e_pk;
	private int c_pk; //회사 아이디
	private String e_name;
	private String e_id;
	private String e_pwd;
	private String e_mail;
	private String e_dept;
	private String e_posi;
	private String e_level; // 직원 or 매니저 
}
