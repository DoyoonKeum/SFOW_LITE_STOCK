package com.yeonoo.sfow.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.yeonoo.sfow.model.Criteria;
import com.yeonoo.sfow.model.NoticeVO;


@Service
public interface NoticeService {
	
	//공지사항 (페이징)
		public List<NoticeVO> getNoticeList(Criteria criteria);
		
		//작성
		public int noticeInsert(NoticeVO noticeVO);
		
		//글상세정보
		public NoticeVO getDetailNotice(int no);
		
		//수정
		public int updateNotice(NoticeVO noticeVO);
		
		//삭제
		public int deleteNotice(int no);
		
		//조회수
		public NoticeVO updateReadCount(int no);
		
		//전체 글 수 조회
		public int totalCount(Criteria criteria);

}
