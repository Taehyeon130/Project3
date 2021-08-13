package com.koreait.workinapp.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.koreait.workinapp.domain.Company;
import com.koreait.workinapp.model.service.main.CompanyService;

@Controller
public class CompanyInfoController {
	
	@Autowired
	private CompanyService companyService;
	
	@GetMapping("/company/info")
	public String getCompanyInfo() {
		
		return "admin/info/company_info";
	}
	
	@GetMapping("/manager/info")
	public String getManagerInfo() {
		
		return "admin/info/manager_info";
	}
	
	//회사 주소 변경
	@PostMapping("/company/update")
	public String updateAddr(Company company) {
		companyService.update(company);
		return "redirect:/admin/company/info";
	}

}
