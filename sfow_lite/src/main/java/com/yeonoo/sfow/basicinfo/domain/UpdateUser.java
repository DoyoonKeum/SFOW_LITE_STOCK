package com.yeonoo.sfow.basicinfo.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class UpdateUser {
	private String id;
	private String companyName;
	private String userName;
	private String phoneNum;
	private String email;
	
	

	public UpdateUser() {
	}

	public UpdateUser(String id, String companyName, String userName, String phoneNum, String email) {
		this.id = id;
		this.companyName = companyName;
		this.userName = userName;
		this.phoneNum = phoneNum;
		this.email = email;
	}
	
	
}
