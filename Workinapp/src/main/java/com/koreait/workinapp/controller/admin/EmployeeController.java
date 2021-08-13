package com.koreait.workinapp.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.koreait.workinapp.model.service.main.EmployeeService;
import com.koreait.workinapp.paging.PagingManager;

@Controller
public class EmployeeController {
	
	@Autowired
	private PagingManager pagingManager;
	
	@Autowired
	private EmployeeService employeeService;
	
	//직원 목록 페이지 요청
	@GetMapping("/employee/list")
	public String getEmployeeList(Model model, HttpServletRequest request) {
		//3단계 : 일시키기
		List employeeList = employeeService.selectAll();
		
		//4단계 : 결과 저장
		model.addAttribute("employeeList", employeeList);
		
		return "admin/employee/employeeList";
	}
}
