package com.yeonoo.sfow.basicinfo.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class MainUserInfo {
	private String companyCode;
	private String companyName;
	private String userName;
	private String id;
	private String password;
	private String adminRole;
	private String phoneNum;
	private String email;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd-HH")
	private Date createDate;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd-HH")
	private Date updateDate;
	

	public MainUserInfo() {
	}


	public MainUserInfo(String companyCode, String companyName, String userName, String id, String password,
			String adminRole, String phoneNum, String email, Date createDate, Date updateDate) {
		this.companyCode = companyCode;
		this.companyName = companyName;
		this.userName = userName;
		this.id = id;
		this.password = password;
		this.adminRole = adminRole;
		this.phoneNum = phoneNum;
		this.email = email;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}
	
	
	
	
	


}
