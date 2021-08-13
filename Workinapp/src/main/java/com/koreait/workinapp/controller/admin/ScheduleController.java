package com.koreait.workinapp.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.koreait.workinapp.model.service.requests.RequestsService;
import com.koreait.workinapp.model.service.work.WorkService;
import com.koreait.workinapp.paging.PagingManager;

@Controller
public class ScheduleController {
	
	@Autowired
	private PagingManager pagingManager;
	
	@Autowired
	private WorkService workService;

	@Autowired
	private RequestsService requestsService;
	
	//근무 목록 페이지 요청
	@GetMapping("/scheduler/list")
	public String getSchedulerList(Model model, HttpServletRequest request) {
		//3단계 : 일시키기
		List workList = requestsService.selectByApprove(2);
		
		//4단계 : 결과 저장
		pagingManager.init(workList, request);
		
		model.addAttribute("workList", workList);
		model.addAttribute("pm", pagingManager);
		
		return "admin/scheduler/scheduler_list";
	}
	
	//근무 달력 페이지 요청
	@GetMapping("/scheduler/calender")
	public String getSchedulerCalender(Model model, HttpServletRequest request) {
		//3단계 : 일시키기
		List workList = requestsService.selectByApprove(2);
		
		//4단계 : 결과 저장
		model.addAttribute("workList", workList);
		
		return "admin/scheduler/scheduler_calender";
	}
	
	//휴가 달력 페이지 요청
	@GetMapping("/dayoff/list")
	public String getDayoffList(Model model, HttpServletRequest request) {
		//3단계 : 일시키기
		List dayoffList = requestsService.selectByApprove(1);
		
		//4단계 : 결과 저장
		pagingManager.init(dayoffList, request);
		
		model.addAttribute("dayoffList", dayoffList);
		model.addAttribute("pm", pagingManager);
		
		return "admin/scheduler/dayoff_list";
	}
	
	//휴가 달력 페이지 요청
	@GetMapping("/dayoff/calender")
	public String getDayoffCalender(Model model, HttpServletRequest request) {
		//3단계 : 일시키기
		List dayoffList = requestsService.selectByApprove(1);
		
		//4단계 : 결과 저장
		model.addAttribute("dayoffList", dayoffList);
		
		return "admin/scheduler/dayoff_calender";
	}
}
