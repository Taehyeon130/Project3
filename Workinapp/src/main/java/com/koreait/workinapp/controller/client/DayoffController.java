package com.koreait.workinapp.controller.client;

import java.net.http.HttpRequest;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.koreait.workinapp.domain.Dayoff;
import com.koreait.workinapp.domain.Employee;
import com.koreait.workinapp.model.service.category.CategoryService;
import com.koreait.workinapp.model.service.dayoff.DayoffService;
import com.koreait.workinapp.model.service.main.EmployeeService;

@Controller
public class DayoffController {

	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private CategoryService categoryService;

	@Autowired
	private DayoffService dayoffService;
	
	
	//휴가 신청 페이지
	@GetMapping("/dayoff/registform")
	public String dayoffRegistForm( Model model,HttpServletRequest request) {

		Employee employee =(Employee)request.getSession().getAttribute("Employee");
		
		List categoryList = categoryService.selectAll();
		List managerList = employeeService.selectManager();
		List dayoffList = dayoffService.selectAllNow(employee.getE_pk());
		
		model.addAttribute("categoryList",categoryList);
		model.addAttribute("managerList",managerList);
		model.addAttribute("dayoffList",dayoffList);
	
		return "client/dayoff/d_regist";
	}
	
	//휴가 등록
	@PostMapping("/dayoff/regist")
	public String regist(Dayoff dayoff) {
		/*
		 * System.out.println(dayoff.getD_date());
		 * System.out.println(dayoff.getD_name());
		 * System.out.println(dayoff.getD_master());
		 * System.out.println(dayoff.getD_note());
		 */
		
		dayoffService.insertDayoff(dayoff);
		return "redirect:/client/main";
	}
	
}
