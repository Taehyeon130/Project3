package com.koreait.workinapp.controller.client;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.koreait.workinapp.domain.Commute;
import com.koreait.workinapp.domain.Employee;
import com.koreait.workinapp.model.service.commute.CommuteService;

//출퇴근 관련 컨트롤러

@Controller
public class CommuteController {
	
	@Autowired
	private CommuteService commuteService;
	
	//클라이언트의 "출퇴근 기록"페이지 요청
	@GetMapping("/commute/list")
	public String getCommuteList(Model model,HttpServletRequest request) {
		
		Employee employee =(Employee)request.getSession().getAttribute("Employee");
		
		List comList = commuteService.selectByEmployee(employee.getE_pk());
		model.addAttribute("comList",comList);
		
		return "client/commute/c_list";
	}
	
	//출근 등록
	@PostMapping("/commute/regist")
	public String insertCommute(Commute commute) {
		commuteService.insert(commute);
		return "redirect:/client/main";
	}
	
	//퇴근 등록
	@PostMapping("/commute/out")
	public String outCommute(Commute commute) {
		commuteService.out(commute);
		return "redirect:/client/main";
	}
}
