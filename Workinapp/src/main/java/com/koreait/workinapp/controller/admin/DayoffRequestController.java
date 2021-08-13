package com.koreait.workinapp.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.koreait.workinapp.model.service.dayoff.DayoffService;
import com.koreait.workinapp.paging.PagingManager;

@Controller
public class DayoffRequestController {
	
	@Autowired
	private PagingManager pagingManager;
	
	@Autowired
	private DayoffService dayoffService;
	
	@GetMapping("/requests/dayoff/list")
	public String getDayoffList(Model model, HttpServletRequest request) {
		//3단계 : 일시키기
		List dayoffList = dayoffService.selectAll();
		
		//4단계 : 결과 저장
		pagingManager.init(dayoffList, request); //페이징 계산처리 !!
		
		model.addAttribute("dayoffList", dayoffList);
		model.addAttribute("pm", pagingManager);
		
		return "admin/requests/dayoff_list";
	}
}
