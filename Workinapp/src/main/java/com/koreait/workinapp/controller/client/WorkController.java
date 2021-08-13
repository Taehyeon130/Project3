package com.koreait.workinapp.controller.client;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.koreait.workinapp.domain.Employee;
import com.koreait.workinapp.domain.Work;
import com.koreait.workinapp.model.service.main.EmployeeService;
import com.koreait.workinapp.model.service.work.WorkService;


@Controller
public class WorkController {
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private WorkService workService;
	
	//일정 신청 페이지
	@GetMapping("/work/registform")
	public String workRegistForm(Model model,HttpServletRequest request) {
		
		Employee employee =(Employee)request.getSession().getAttribute("Employee");
		List managerList = employeeService.selectManager();
		List workList= workService.selectPk(employee.getE_pk());
		
		model.addAttribute("managerList",managerList);
		model.addAttribute("workList",workList);
		
		return "client/work/w_regist";
	}
	
	//일청 추가 요청
	@PostMapping("/work/regist")
	public String workRegist(Work work) {
		workService.insert(work);
		return "redirect:/client/main";
	}
	
}
