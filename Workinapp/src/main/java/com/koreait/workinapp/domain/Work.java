package com.koreait.workinapp.domain;

import lombok.Data;

@Data
public class Work {
	private int w_pk;
    private int c_pk; 
    private int e_pk; 
    private String w_date; 
    private String w_time; 
    private String w_dept;
    private String w_posi; 
    private String w_name; 
    private String w_note;
    private String w_master;
    private int w_status; 
}
