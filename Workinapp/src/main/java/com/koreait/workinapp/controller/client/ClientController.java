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
import com.koreait.workinapp.model.service.category.TopCategoryService;
import com.koreait.workinapp.model.service.main.EmployeeService;
import com.koreait.workinapp.model.service.requests.RequestsService;

@Controller
public class ClientController {
	
	/*
	 * @Autowired private DayoffService dayoffService;
	 */

	@Autowired 
	private EmployeeService employeeService;
	
	/*
	 * @Autowired private WorkService workService;
	 */

	@Autowired
	private RequestsService requestsService;
	
	@Autowired
	private TopCategoryService topCategoryService;
	
	
	//클라이언트의 메인 페이지 요청
	@GetMapping("/main")
	public String getMain(Model model, HttpServletRequest request) {
		Employee employee =(Employee)request.getSession().getAttribute("Employee");
	
		List noWorkList = requestsService.selectNoWork(employee.getE_pk());
		List noDayoffList = requestsService.selectNoDayoff(employee.getE_pk());
		List okRequestList = requestsService.selectOkRequests(employee.getE_pk());
		//System.out.println(okRequestList);
		
		List dayoffList = requestsService.selectDayoff(employee.getE_pk());
		List workList = requestsService.selectWork(employee.getE_pk());
		
		
		List employeeList = employeeService.selectEmployee();
		List topCategoryList = topCategoryService.selectAll();
		
		List firstList = requestsService.selectByEmployee(1);
		List secondList = requestsService.selectByEmployee(2);
		List thirdList = requestsService.selectByEmployee(3);
		

		
		//List selectByEmpl = requestsService.selectByEmployee(e_pk);
		
		model.addAttribute("noWorkList",noWorkList);
		model.addAttribute("noDayoffList",noDayoffList);
		model.addAttribute("okRequestList",okRequestList);
		model.addAttribute("employeeList",employeeList);
		model.addAttribute("topCategoryList",topCategoryList);
		model.addAttribute("dayoffList",dayoffList);
		model.addAttribute("workList",workList);
		
		model.addAttribute("firstList",firstList);
		model.addAttribute("secondList",secondList);
		model.addAttribute("thirdList",thirdList);
		
		
		//model.addAttribute("selectByEmpl",selectByEmpl);
		
		return "client/client_main";
	}
	
	//클라이언트의 "내 요청들" 페이지 요청
	@GetMapping("/request/list")
	public String getRequestList(Model model, HttpServletRequest request) {
		
		Employee employee =(Employee)request.getSession().getAttribute("Employee");
		
		List reqList = requestsService.selectByEmployee(employee.getE_pk());
	
		
		
		model.addAttribute("reqList",reqList);
		
		/*
		 * List workList = workService.selectPk(employee.getE_pk()); List dayoffList =
		 * dayoffService.selectAllNow(employee.getE_pk());
		 */
		
		
		return "client/request/r_list";
	}
	
	//클라이언트 설정 페이지 요청
	@GetMapping("/setting")
	public String getSetting(Model model, HttpServletRequest request) {
		Employee employee =(Employee)request.getSession().getAttribute("Employee");
		Employee empl = employeeService.selectNow(employee.getE_pk());
		
		model.addAttribute("empl",empl);
		
		return "client/setting/setting_info";
	}
	
	//이메일 변경 요청
	@PostMapping("/setting/email")
	public String changeMain(Employee employee) {
		//System.out.println(employee.getE_mail());		
		employeeService.updateEmail(employee);
		return "redirect:/client/setting";
	}
	

	
	
}
