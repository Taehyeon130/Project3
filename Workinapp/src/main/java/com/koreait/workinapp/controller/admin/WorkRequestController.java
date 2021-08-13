package com.koreait.workinapp.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.koreait.workinapp.domain.Requests;
import com.koreait.workinapp.domain.Work;
import com.koreait.workinapp.model.service.category.TopCategoryService;
import com.koreait.workinapp.model.service.requests.RequestsService;
import com.koreait.workinapp.model.service.work.WorkService;
import com.koreait.workinapp.paging.PagingManager;

@Controller
public class WorkRequestController {

	@Autowired
	private PagingManager pagingManager;

	@Autowired
	private RequestsService requestsService;

	// 근무 요청 페이지
	@GetMapping("/requests/req/list")
	public String getWorkList(Model model, HttpServletRequest request) {
		//3단계 : 일시키기
		List workList = requestsService.selectAll(0);
		
		//4단계 : 결과 저장
		pagingManager.init(workList, request); //페이징 계산처리 !!
		
		model.addAttribute("workList", workList);
		model.addAttribute("pm", pagingManager);
		System.out.println(workList);

		return "admin/requests/req_list";
	}

	// 근무 승인 요청
	@PostMapping("/requests/req/approve")
	public String getApprove(Requests requests) {
		// System.out.println("승인 요청 컨트롤러 호출 성공!");
		requestsService.update(requests);
		return "redirect:/admin/requests/req/list";
	}

	// 근무 승인 거절
	@PostMapping("/requests/req/reject")
	public String getReject(Requests requests) {
		// System.out.println("승인 요청 컨트롤러 호출 성공!");
		requestsService.delete(requests);
		return "redirect:/admin/requests/req/list";
	}
}
