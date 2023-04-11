package com.yeonoo.sfow.basicinfo.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.sfow.basicinfo.domain.CompanyInfo;
import com.yeonoo.sfow.basicinfo.service.CompanyInfoService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class CompanyInfoController {
	
	
	private final CompanyInfoService companyInfoService;
	
	// 회사 정보 확인
		@GetMapping("/companyInfo")
		public String companyinfo(@RequestParam("companyCode") String code, Model model,HttpServletResponse response) throws Exception {
			CompanyInfo companyInfo=companyInfoService.companyInfoRead(code);
			model.addAttribute("companyInfo",companyInfo);
			return "basicinfo/companyinfo";
		}
		
		
		@PostMapping("/companyInfoUpdate")
		public @ResponseBody String companyInfoUpdate(CompanyInfo companyInfo) throws Exception {
			
			int result=companyInfoService.companyInfoModify(companyInfo);
			
			if(result==1) {
				return "1";
			} else if(result !=1) {
				return "0";
			}
			return null;
			
		}

}
