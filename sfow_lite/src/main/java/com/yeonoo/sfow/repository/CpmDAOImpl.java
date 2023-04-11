package com.yeonoo.sfow.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yeonoo.sfow.model.CpmVO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class CpmDAOImpl implements CpmDAO {

	private final SqlSession sqlSession;
	
	//전체
	@Override
	public List<CpmVO> cpmlist(String companyCode) {
		 List<CpmVO>  list= sqlSession.selectList("mapper.company.cpmlist",companyCode);
		return list;
	}

	//등록
	@Override
	public int cpmInsert(CpmVO cpmVO) {
		return sqlSession.insert("mapper.company.cpmInsert",cpmVO);
	}

	//수정
	@Override
	public int updatecpm(CpmVO cpmVO) {
		System.out.println(cpmVO);
		int cnt=sqlSession.update("updatecpm",cpmVO);
		return cnt;
	}

	//삭제
	@Override
	public int deletecpm(int no) { 
	int cnt	= sqlSession.delete("mapper.company.deletecpm",no);
	System.out.println(cnt);
	return cnt;
	}

	
	
}
