package com.yeonoo.sfow.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yeonoo.sfow.model.CpmVO;
import com.yeonoo.sfow.service.CpmService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
@RestController // @ResponseBody(JSON)응답
public class CpmController {
	
	@Autowired
	private CpmService cpmSericeImpl;
	
	//전체
	// @ResponseBody->jackson-databind(객체를->JSON 데이터포멧으로 변환)
			@RequestMapping(value="/cpm")
			public List<CpmVO> cpmlist(Model model,HttpSession session,String companyCode){
				List<CpmVO> list=cpmSericeImpl.cpmlist(companyCode);
				System.out.println(list);
		
				
				return list; // JSON 데이터 형식으로 변환(API)해서 리턴(응답)하겠다.
			}	
	
		
				//등록
				@RequestMapping("/insert")
				public String cpmInsert(@RequestBody CpmVO cpmVO) throws Exception {
					System.out.println("newUserAjax=======" + cpmVO);
					
					int result=cpmSericeImpl.cpmInsert(cpmVO);
					
					
					return "1";
				}	
			
			
	//수정
				@RequestMapping(value ="/update")
				public String updatecpm(@RequestBody CpmVO cpmVO) throws Exception {
				    // VO 객체의 이메일 주소 유효성 검사
				

				    int result = cpmSericeImpl.updatecpm(cpmVO);
				    if (result > 0) {
				        System.out.println("레코드 수정이 완료되었습니다.");
				    } else {
				        System.out.println("레코드 수정에 실패하였습니다.");
				    }

				    return "success";
				}



	
	
	//삭제
	@RequestMapping("/deletecpm")
	public String deletecpm(@RequestBody int no) throws Exception {
		/*
		 * String id = client_Code; if (id.startsWith("\"") && id.endsWith("\"")) { id =
		 * id.substring(1, id.length() - 1); }
		 */
		System.out.println(no); // sisisisisisi 출력

		int result = cpmSericeImpl.deletecpm(no);
		
		
	    return "1";
	}
	
	
	
}
