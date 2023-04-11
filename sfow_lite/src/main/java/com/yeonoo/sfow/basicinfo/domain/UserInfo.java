package com.yeonoo.sfow.basicinfo.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class UserInfo {
	private String companyCode;
	private String companyName;
	private String userName;
	private String id;
	private String updateKey;
	private String password;
	private String adminRole;
	private String phoneNum;
	private String email;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date createDate;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date updateDate;
	
	
	public UserInfo(String companyCode, String companyName, String userName, String id, String updateKey,
			String password, String adminRole, String phoneNum, String email, Date createDate, Date updateDate) {
		this.companyCode = companyCode;
		this.companyName = companyName;
		this.userName = userName;
		this.id = id;
		this.updateKey = updateKey;
		this.password = password;
		this.adminRole = adminRole;
		this.phoneNum = phoneNum;
		this.email = email;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}


	public UserInfo() {
	}
	
	
	
	
	


}
