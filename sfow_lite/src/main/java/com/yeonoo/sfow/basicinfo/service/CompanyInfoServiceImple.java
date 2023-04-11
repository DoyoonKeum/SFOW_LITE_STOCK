package com.yeonoo.sfow.basicinfo.service;

import org.springframework.stereotype.Service;

import com.yeonoo.sfow.basicinfo.domain.CompanyInfo;
import com.yeonoo.sfow.basicinfo.repository.CompanyInfoRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CompanyInfoServiceImple implements CompanyInfoService {
	
	
	private final CompanyInfoRepository companyInfoRepository;
	

	@Override
	public CompanyInfo companyInfoRead(String code) throws Exception {
		CompanyInfo companyInfo=companyInfoRepository.companyInfoSelect(code);
		return companyInfo;
	}


	@Override
	public int companyInfoModify(CompanyInfo companyInfo) throws Exception {
		int result=companyInfoRepository.companyInfoUpdate(companyInfo);
		return result;
	}

}
