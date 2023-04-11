package com.yeonoo.sfow.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeonoo.sfow.model.Criteria;
import com.yeonoo.sfow.model.NoticeVO;
import com.yeonoo.sfow.repository.NoticeDAO;

import lombok.RequiredArgsConstructor;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	 NoticeDAO noticeDAOImpl;
	
	@Autowired
	Criteria criteria;
	
	//전체리스트
	@Override
	public List<NoticeVO> getNoticeList(Criteria criteria) {
		List<NoticeVO> noticeList =noticeDAOImpl.getNoticeList(criteria);
		return noticeList;
	}


	//작성
	@Override
	public int noticeInsert(NoticeVO noticeVO) {
		return noticeDAOImpl.noticeInsert(noticeVO);
	}
	
	//상세
	@Override
	public NoticeVO getDetailNotice(int no) {
		return noticeDAOImpl.getDetailNotice(no);
	}

	
	//수정
	@Override
	public int updateNotice(NoticeVO noticeVO) {
		return noticeDAOImpl.updateNotice(noticeVO);
	}

	
	//삭제
	@Override
	public int deleteNotice(int no) {
		return noticeDAOImpl.deleteNotice(no);
	}

	
	//조회수
	@Override
	public NoticeVO updateReadCount(int no) {
		return noticeDAOImpl.updateReadCount(no);
	}

	//전체 글 수 
	@Override
	public int totalCount(Criteria criteria) {
		return noticeDAOImpl.totalCount(criteria);
	}

}
