package com.yeonoo.sfow.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yeonoo.sfow.model.Criteria;
import com.yeonoo.sfow.model.NoticeVO;


@Repository
public class NoticeDAOImpl implements NoticeDAO{

	
	@Autowired
	private SqlSession sqlSession;
	
	//공지사항 게시글 전체 리스트
	@Override
	public List<NoticeVO> getNoticeList(Criteria criteria) {
		List<NoticeVO> noticeList =sqlSession.selectList("mapper.notice.noticeList", criteria);
		return noticeList;
	}

	
	//글작성
	@Override
	public int noticeInsert(NoticeVO noticeVO) {
		return sqlSession.insert("mapper.notice.noticeInsert",noticeVO);
	}
	
	
	//상세정보
	@Override
	public NoticeVO getDetailNotice(int no) {
		return sqlSession.selectOne("mapper.notice.getDetailNotice",no);
	}

	//수정
	@Override
	public int updateNotice(NoticeVO noticeVO) {
		return sqlSession.update("mapper.notice.updateNotice",noticeVO);
	}

	//삭제
	@Override
	public int deleteNotice(int no) {
		int cnt	= sqlSession.delete("mapper.notice.deleteNotice",no);
		System.out.println(cnt);
		return cnt;
	}

	//조회수
	@Override
	public NoticeVO updateReadCount(int no) {
		return sqlSession.selectOne("mapper.notice.updateReadCount",no);
	}

	//전체글
	@Override
	public int totalCount(Criteria criteria) {
		return sqlSession.selectOne("mapper.notice.totalcnt",criteria);
	}

}
