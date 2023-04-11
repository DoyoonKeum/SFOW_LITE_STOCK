package com.yeonoo.sfow.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeonoo.sfow.model.CpmVO;
import com.yeonoo.sfow.repository.CpmDAO;

@Service
public class CpmSericeImpl implements CpmService{

	
	@Autowired
	private CpmDAO cpmDAOImpl;
	
	//전체
	@Override
	public List<CpmVO> cpmlist(String companyCode) {
		List<CpmVO> list = cpmDAOImpl.cpmlist(companyCode);
		return list;
	}
	
	//등록
	@Override
	public int cpmInsert(CpmVO cpmVO) {
		return cpmDAOImpl.cpmInsert(cpmVO);
	}

	//수정
	@Override
	public int updatecpm(CpmVO cpmVO) {
		return cpmDAOImpl.updatecpm(cpmVO);
	}

	
	//수정
	@Override
	public int deletecpm(int no) {
		return cpmDAOImpl.deletecpm(no);
	}

	
	
}
