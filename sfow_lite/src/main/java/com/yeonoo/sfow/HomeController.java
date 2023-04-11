package com.yeonoo.sfow;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "login";
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String layout(Locale locale, Model model,HttpSession session) {
		Object sessionId=session.getAttribute("AUTHUSER");
		return "layout";
	}
	
	@RequestMapping("/main")
	public String reqMainContent() {
		return "main";
	}

	@RequestMapping("/main2")
	public String main(Model model) {
		
		
		return "cpm/clist4";
	}
	
	
	@RequestMapping("/main3")
	public String main3(Model model) {
		
		
		return "notice/noticeList";
	}
}
