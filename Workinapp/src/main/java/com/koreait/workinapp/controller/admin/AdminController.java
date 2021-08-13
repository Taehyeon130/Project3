package com.koreait.workinapp.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
		
	@GetMapping("/test")
	public String test() {
		
		return "admin/test";
	}
	
	@GetMapping("/home")
	public String getMain() {
		
		return "admin/home";
	}

}
