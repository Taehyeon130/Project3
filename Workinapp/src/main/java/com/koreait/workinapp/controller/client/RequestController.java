package com.koreait.workinapp.controller.client;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.workinapp.domain.Employee;
import com.koreait.workinapp.domain.Requests;
import com.koreait.workinapp.domain.SubCategory;
import com.koreait.workinapp.model.service.category.SubCategoryService;
import com.koreait.workinapp.model.service.category.TopCategoryService;
import com.koreait.workinapp.model.service.main.EmployeeService;
import com.koreait.workinapp.model.service.requests.RequestsService;

//클라이언트의 요청을 처리하는 컨트롤러

@Controller
public class RequestController {
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private TopCategoryService topCategoryService;
	
	@Autowired
	private SubCategoryService subCategoryService;
	
	@Autowired
	private RequestsService requestsService;
	
	
	//요청 등록 폼 
	@GetMapping("/request/registform")
	public String registForm(Model model,HttpServletRequest request) {
		
		Employee employee =(Employee)request.getSession().getAttribute("Employee");
		
	
		
		
		List topList = topCategoryService.selectAll();
		List subList = subCategoryService.selectAll();
		List managerList = employeeService.selectManager();
		List reqList = requestsService.selectByEmployee(employee.getE_pk());
		
		model.addAttribute("topList",topList);
		model.addAttribute("subList",subList);
		model.addAttribute("managerList",managerList);
		model.addAttribute("reqList",reqList);
		return "client/request/r_regist";
	}
	
	@PostMapping("/requests/regist")
	public String regist(Requests requests) {
		//System.out.println(requests.getReq_note());
		requestsService.insert(requests);
		return "redirect:/client/main";
	}
	
	
	
	
	
	//선택한 topcategory에 소속된 하위 카테고리 모두 가져오기
	@RequestMapping(value="/request/sublist", method=RequestMethod.GET)
	@ResponseBody
	public List<SubCategory> getTopDetail(int top_pk, Model model){
		List subList = subCategoryService.selectAllById(top_pk);
		
		return subList;
	}
	
	
}
