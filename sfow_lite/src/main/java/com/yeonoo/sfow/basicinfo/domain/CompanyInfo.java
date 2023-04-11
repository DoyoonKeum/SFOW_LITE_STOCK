package com.yeonoo.sfow.basicinfo.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CompanyInfo {
	private String companyCode;
	private String companyName;
	private String ceoName;
	private String companyPhone;
	private String email;
	private String address;
	private String memo;
	private Date createDate;
	private Date updateDate;
	private String updateUser;
	
	
	
	public CompanyInfo(String companyCode, String companyName, String ceoName, String companyPhone, String email,
			String address, String memo, Date createDate, Date updateDate, String updateUser) {
		this.companyCode = companyCode;
		this.companyName = companyName;
		this.ceoName = ceoName;
		this.companyPhone = companyPhone;
		this.email = email;
		this.address = address;
		this.memo = memo;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.updateUser = updateUser;
	}


	public CompanyInfo() {
	}
	
	
	
	
}
