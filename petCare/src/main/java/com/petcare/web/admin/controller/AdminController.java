package com.petcare.web.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	@GetMapping("/ad_charts.mdo")
	public String ad_chartsGet() {
		return "ad_charts";
	}

	@GetMapping("/ad_community.mdo")
	public String ad_communityGet() {
		return "ad_community";
	}

	@GetMapping("/ad_encyclopedia.mdo")
	public String ad_encyclopediaGet() {
		return "ad_encyclopedia";
	}

	@GetMapping("/ad_hospital.mdo")
	public String ad_hospitalGet() {
		return "ad_hospital";
	}

	@GetMapping("/ad_user.mdo")
	public String ad_userGet() {
		return "ad_user";
	}

	@GetMapping("/comm_getBoard.mdo")
	public String comm_getBoardGet() {
		return "comm_getBoard";
	}

	@GetMapping("/en_getBoard.mdo")
	public String en_getBoardGet() {
		return "en_getBoard";
	}

	@GetMapping("/en_insert.mdo")
	public String en_insertGet() {
		return "en_insert";
	}

	@GetMapping("/ad_login.mdo")
	public String ad_loginGet() {
		return "ad_login";
	}
}