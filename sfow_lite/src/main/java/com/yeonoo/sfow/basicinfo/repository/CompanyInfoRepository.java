package com.yeonoo.sfow.basicinfo.repository;

import com.yeonoo.sfow.basicinfo.domain.CompanyInfo;

public interface CompanyInfoRepository {
	
	public CompanyInfo companyInfoSelect(String code) throws Exception;
	
	public int companyInfoUpdate(CompanyInfo companyInfo) throws Exception;
}
