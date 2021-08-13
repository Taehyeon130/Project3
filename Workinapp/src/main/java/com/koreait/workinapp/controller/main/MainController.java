package com.koreait.workinapp.controller.main;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.workinapp.exception.EmployeeExistException;
import com.koreait.workinapp.domain.Company;
import com.koreait.workinapp.domain.Employee;
import com.koreait.workinapp.exception.EmployeeExistException;
import com.koreait.workinapp.model.service.main.CompanyService;
import com.koreait.workinapp.model.service.main.EmployeeService;

@Controller
public class MainController {
	
	@Autowired
	private EmployeeService employeeService;

	// 濡쒓렇�씤 �뤌 �슂泥� 泥섎━
	@GetMapping("/joinform")
	public String joinForm() {
		
		return "join";
	}
	
	//濡쒓렇�씤 �슂泥� 泥섎━ (post)
	@PostMapping("/login")
	public String login(Employee employee, HttpServletRequest request) {
		//3�떒怨� : �씪�떆�궎湲�
		Employee obj = employeeService.login(employee);
		
		//4�떒怨� : �꽭�뀡�뿉 寃곌낵 ���옣
		HttpSession session = request.getSession();
		session.setAttribute("Employee", obj);
		return "redirect:/main/companies";
	}
	
	//濡쒓렇�븘�썐 �슂泥� 泥섎━
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.invalidate();
		return "join";
	}
	
	//�쉶�썝媛��엯 �슂泥� 泥섎━ (post)
	@PostMapping("/join")
	public String join(Employee employee) {
		employeeService.regist(employee);
		
		return "join";
	}
	
	//�쐞�뿉 �슂泥��쓣 泥섎━�븯�뒗 硫붿꽌�뱶 以묒뿉�꽌, �뼱�뒓寃� �븯�굹�씪�룄 �삁�쇅媛� 諛쒖깮�븯硫� �븘�옒�쓽 硫붿꽌�뱶媛� �룞�옉�븯寃� �맖
	@ExceptionHandler(EmployeeExistException.class)
	public String handleException(EmployeeExistException e, Model model) {
		model.addAttribute("e", e);
		
		return "error/result";
	}
}
