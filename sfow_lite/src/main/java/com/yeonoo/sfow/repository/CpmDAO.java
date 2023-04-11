package com.yeonoo.sfow.repository;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.yeonoo.sfow.model.CpmVO;

public interface CpmDAO {

	
	//전체보기
	public List<CpmVO> cpmlist(String companyCode) throws DataAccessException;
	
	//거래처 등록
	public int cpmInsert(CpmVO cpmVO);
	
	//거래처 수정
	public int updatecpm(CpmVO cpmVO);
	
	//삭제
	public int deletecpm(int no);
	
	
	
}
