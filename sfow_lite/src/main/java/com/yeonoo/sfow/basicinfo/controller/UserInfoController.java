package com.yeonoo.sfow.basicinfo.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.sfow.basicinfo.domain.UserInfo;
import com.yeonoo.sfow.basicinfo.service.UserInfoService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class UserInfoController {
	
	private final UserInfoService userInfoService;
	
	
	//로그인페이지
	@RequestMapping("/login")
	public String userLogin(Model model,HttpSession session) {
		return "login";
	}
	
	//로그인
	@PostMapping("/login")
	public @ResponseBody String userLogin(UserInfo userInfo,Model model,HttpSession session,HttpServletRequest request) throws Exception {
		
		UserInfo loginUser = userInfoService.userLogin(userInfo);

		session.setMaxInactiveInterval(1800);
		
		session.setAttribute("AUTHUSER", loginUser);
		
		if(loginUser==null) {
			return "1";
		} else {
			return "2";
		}
	}
	
	//로그아웃
	 @RequestMapping("/userLogout") 
	 public String userLogout(HttpSession session) { 
			session.invalidate();
			return "redirect:/login"; 
	}
	
	//회원 정보 변경 페이지
	@GetMapping("/updateUser")
	public String updateUser(HttpSession session) {
		return "basicinfo/updateUser";
	}
	
	 
	//사용자 계정관리 페이지
	@RequestMapping("/userManagement")
	public String userManagement() throws Exception {
		return "basicinfo/userManagement";
	}
	
	
	@RequestMapping("/sessionLogout")
	public String sessionLogout(HttpSession session,HttpServletRequest request) throws Exception {
		return "basicinfo/sessionLogout";
	}
	
	@RequestMapping("/sessionLogin")
	public String sessionLogin(HttpSession session,HttpServletRequest request) throws Exception {
		return "basicinfo/sessionLogin";
	}
}
