package com.yeonoo.sfow.basicinfo.service;

import java.util.List;

import com.yeonoo.sfow.basicinfo.domain.AdminRollUser;
import com.yeonoo.sfow.basicinfo.domain.UpdateUser;
import com.yeonoo.sfow.basicinfo.domain.UserInfo;


public interface UserInfoService {
	
	//유저 정보 불러오기
	public UserInfo updateUserInfo(String id) throws Exception;
	
	//로그인
	public UserInfo userLogin(UserInfo userInfo) throws Exception;
	
	//일반 계정 수정
	public UserInfo userInfoModify(UpdateUser updateUser) throws Exception;
	
	//관리자 계정 수정
	public UserInfo mainUserModify(UpdateUser updateUser) throws Exception;
	
	//사용자 목록 
	public List<UserInfo> userListAll(String companyCode) throws Exception;
	
	//일반 사용자 계정관리
	public int userListModify(UserInfo userInfo) throws Exception;
	
	//계정 생성(그리드)
	public int newUserAdd(UserInfo newUserInfo) throws Exception;
	
	//계정 삭제(그리드)
	public int removeUser(String deleteId) throws Exception;
	
	//유저 검색
	public List<UserInfo> searchUser(String id) throws Exception;
	
	
	//유저 ID 중복 검사
	public UserInfo checkDuplicateUserId(String updateId) throws Exception;
	
	//유저 관리자 권한 부여
	public int userAdminRollUpdate(AdminRollUser adminRollUser) throws Exception;
	
	
}
