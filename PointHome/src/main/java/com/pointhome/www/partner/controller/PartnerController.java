package com.pointhome.www.partner.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/partner")
public class PartnerController {
	
	@GetMapping("/detail")
	public void detailGet() {
		
	}
	
}
