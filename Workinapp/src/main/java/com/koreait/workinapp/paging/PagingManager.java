package com.koreait.workinapp.paging;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class PagingManager {
	int totalRecord; //珥� �젅肄붾뱶 �닔
	int pageSize=10; //�럹�씠吏��떦 蹂댁뿬吏� �젅肄붾뱶 �닔
	int totalPage;
	int blockSize=10; //釉붾윮�떦 蹂댁뿬吏� �럹�씠吏� �닔
	int currentPage=1; //�쁽�옱 �럹�씠吏�
	int firstPage;
	int lastPage;
	int curPos;
	int num;
	
	public void init(List list, HttpServletRequest request) {
		totalRecord=list.size();
		totalPage=(int)Math.ceil((double)totalRecord/pageSize);
		
		if(request.getParameter("currentPage")!=null) {
			currentPage=Integer.parseInt(request.getParameter("currentPage"));
		}
		firstPage = currentPage -(currentPage-1)%blockSize;
		lastPage = firstPage +(blockSize-1);
		curPos=(currentPage-1)*pageSize;
		num=totalRecord-curPos;
	}
}
