package com.yeonoo.sfow.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yeonoo.sfow.basicinfo.domain.UserInfo;
import com.yeonoo.sfow.model.Criteria;
import com.yeonoo.sfow.model.NoticeVO;
import com.yeonoo.sfow.model.PageMaker;
import com.yeonoo.sfow.service.NoticeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@RequiredArgsConstructor
@RestController
@Controller
public class NoticeController {

	@Autowired
	private  NoticeService noticeServiceImpl;
	
	@Autowired
	private PageMaker pageMaker;
	@Autowired
	private Criteria criteria;
	
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getNoticeList(Criteria criteria, HttpSession session,Model model) {
	    Map<String, Object> data = new HashMap<>();

	    // 페이지 처리
	    List<NoticeVO> noticeList = noticeServiceImpl.getNoticeList(criteria);

	    // 페이징 처리에 필요한 부분
	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCriteria(criteria);
	    pageMaker.setTotalCount(noticeServiceImpl.totalCount(criteria));

	    // Map 객체에 데이터 추가
	    data.put("pageMaker", pageMaker);
	    data.put("noticeList", noticeList);
	  

	    return data;
	}


    
    //등록
    @RequestMapping("notice/insert")
    public void inserNotice(NoticeVO noticeVO, RedirectAttributes rttr) {
    	
		noticeServiceImpl.noticeInsert(noticeVO);
		rttr.addFlashAttribute("result",noticeVO.getNo());
		//return "redirect:/notice";
		
	}

    
  //특정 상세 조회
  //특정 상세 조회
    @GetMapping(value ="/read/{no}")
    @ResponseBody
    public NoticeVO getDetailNotice(@PathVariable("no") int no, Model model, @ModelAttribute("criteria") Criteria criteria) {
        
        //조회수
        NoticeVO cnt = noticeServiceImpl.updateReadCount(no);
        
        //상세
        NoticeVO noticeVO = noticeServiceImpl.getDetailNotice(no);
        
        model.addAttribute("noticeVO", noticeVO);
        return noticeVO;
    }
    
    @PutMapping("/updateForm/{no}")
    public ResponseEntity<NoticeVO> updateNotice(@PathVariable("no") int no, @RequestBody NoticeVO noticeVO ,Criteria criteria,RedirectAttributes rttr) {
        noticeVO.setNo(no);
        noticeServiceImpl.updateNotice(noticeVO);
        
    	
    	rttr.addAttribute("page", criteria.getPage());
    	rttr.addAttribute("perPageNum", criteria.getPerPageNum());
    	rttr.addAttribute("type", criteria.getType());
    	rttr.addAttribute("keyword", criteria.getKeyword());
    	   	
        
        return ResponseEntity.ok(noticeVO);
    }


    
  //삭제
    @RequestMapping(value ="/delete/{no}",method=RequestMethod.DELETE)
    public void deleteNotice(@PathVariable("no")int no,Criteria criteria ,RedirectAttributes rttr) {
    	noticeServiceImpl.deleteNotice(no);
    
    	rttr.addAttribute("page", criteria.getPage());
    	rttr.addAttribute("perPageNum", criteria.getPerPageNum());
    	rttr.addAttribute("type", criteria.getType());
    	rttr.addAttribute("keyword", criteria.getKeyword());
    	System.out.println("Criteria="+criteria);
    	
		//return "redirect:/notice";
    }

}
