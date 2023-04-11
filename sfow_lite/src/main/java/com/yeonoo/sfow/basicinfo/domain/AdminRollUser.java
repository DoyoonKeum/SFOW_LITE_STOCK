package com.yeonoo.sfow.basicinfo.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class AdminRollUser {
	private String adminRoll;
	private String id;

	
	
	
	public AdminRollUser(String adminRoll, String id) {
		this.adminRoll = adminRoll;
		this.id = id;
	}
	
	public AdminRollUser() {
	}
	
	

	
	
}
