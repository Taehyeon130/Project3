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

import com.koreait.workinapp.domain.Company;
import com.koreait.workinapp.domain.Employee;
import com.koreait.workinapp.exception.EmployeeExistException;
import com.koreait.workinapp.model.service.main.CompanyService;

@Controller
public class CompaniesController {
	
	@Autowired
	private CompanyService companyService;
	
	//회사 목록 페이지 요청 처리
	@GetMapping("/companies")
	public String getCompanies(Model model, HttpServletRequest request) {
		//3단계 : 일시키기
		List companyList = companyService.selectAll();
		
		//4단계 : 결과 저장
		model.addAttribute("companyList", companyList);
		return "companies";
	}
	
	//회사 생성 요청 처리
	@PostMapping("/companies/create")
	public String registCompany(Company company) {
		companyService.insert(company);
		
		return "redirect:/main/companies";
	}
	
	//회사 로그인 요청 처리
	@PostMapping("/companies/login")
	public String loginCompany(Company company, HttpServletRequest request){
		String result = null;
		
		//3단계 : 일시키기
		Company obj = companyService.select(company);
		
		//4단계 : 결과저장
		HttpSession session = request.getSession();
		session.setAttribute("Company", obj);
		Employee employee = (Employee)session.getAttribute("Employee");
		
		//세션에 레벨 값에 따라서 매니저와 직원 페이지를 나누기
		if(employee.getE_level().equals("Manager")) {
			result = "redirect:/admin/scheduler/calender";
		}else if(employee.getE_level().equals("Employee")) {
			// result 값에 클라이언트 메인페이지를 넣어주세요
			result = "redirect:/client/main";
		}		

		return result;
	}
	
	//위에 요청을 처리하는 메서드 중에서, 어느것 하나라도 예외가 발생하면 아래의 메서드가 동작하게 됨
	@ExceptionHandler(EmployeeExistException.class)
	public String handleException(EmployeeExistException e, Model model) {
		model.addAttribute("e", e);
		
		return "error/result";
	}
}
