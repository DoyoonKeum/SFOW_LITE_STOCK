package com.yeonoo.sfow.basicinfo.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yeonoo.sfow.basicinfo.domain.CompanyInfo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class CompanyInfoRepositoryImpl implements CompanyInfoRepository{

	private final SqlSession sqlSession;
	
	@Override
	public CompanyInfo companyInfoSelect(String code) {
		CompanyInfo companyInfo=sqlSession.selectOne("companyInfo",code);
		return companyInfo;
	}

	@Override
	public int companyInfoUpdate(CompanyInfo companyInfo) throws Exception {
		
		int result=sqlSession.update("companyInfoUpdate",companyInfo);
		
		return result;
	}

}
