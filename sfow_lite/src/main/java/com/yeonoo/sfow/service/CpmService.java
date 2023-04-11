package com.yeonoo.sfow.service;

import java.util.List;

import com.yeonoo.sfow.model.CpmVO;

public interface CpmService {
	
	//전체보기
		public List<CpmVO> cpmlist(String companyCode);
		
		//거래처 등록
		public int cpmInsert(CpmVO cpmVO);
		
		//거래처 수정
		public int updatecpm(CpmVO cpmVO);
		
		//삭제
		public int deletecpm(int no);
}
