package com.yeonoo.sfow.basicinfo.service;

import com.yeonoo.sfow.basicinfo.domain.CompanyInfo;

public interface CompanyInfoService {
	
	public CompanyInfo companyInfoRead(String code) throws Exception;
	
	public int companyInfoModify(CompanyInfo companyInfo) throws Exception;
	
}
