package com.yeonoo.sfow.basicinfo.repository;

import java.util.List;

import com.yeonoo.sfow.basicinfo.domain.AdminRollUser;
import com.yeonoo.sfow.basicinfo.domain.UpdateUser;
import com.yeonoo.sfow.basicinfo.domain.UserInfo;

public interface UserInfoRepository{
	
	public UserInfo userInfoSelect(int no) throws Exception;
	
	//로그인
	public UserInfo userValidate(UserInfo userInfo) throws Exception;
	
	//일반 계정 수정
	public UserInfo userInfoUpdate(UpdateUser updateUser) throws Exception;
	
	//관리자 계정 수정
	public UserInfo mainUserInfoUpdate(UpdateUser updateUser) throws Exception;
	
	public List<UserInfo> userInfoSelectAll(String companyCode) throws Exception;
	
	//사용자 계정관리 - 수정
	public int userListUpdate(UserInfo userInfo) throws Exception;
	
	public int newUserInsert(UserInfo newUserInfo) throws Exception;
	
	public int deleteUser(String deleteId) throws Exception;
	
	//사용자 이름 검색
	public List<UserInfo> searchData(String userName) throws Exception;
	
	//개인정보수정 데이터 조회
	public UserInfo updateUserSelect(String id) throws Exception;
	
	//유저 ID 중복 검사
	public UserInfo checkDuplicateUserId(String updateId) throws Exception;
	
	//유저 관리자 권한 부여
	public int userAdminRollUpdate(AdminRollUser adminRollUser) throws Exception;

}
