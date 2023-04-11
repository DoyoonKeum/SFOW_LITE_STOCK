package com.yeonoo.sfow.basicinfo.service;

import java.util.List;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.yeonoo.sfow.basicinfo.domain.AdminRollUser;
import com.yeonoo.sfow.basicinfo.domain.UpdateUser;
import com.yeonoo.sfow.basicinfo.domain.UserInfo;
import com.yeonoo.sfow.basicinfo.repository.UserInfoRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor

public class UserInfoServiceImpl implements UserInfoService{

	private final UserInfoRepository userInfoRepository; 

	@Override
	public UserInfo userLogin(UserInfo userInfo) throws Exception {
		return userInfoRepository.userValidate(userInfo);
	}

	@Override
	public UserInfo userInfoModify(UpdateUser updateUser) throws Exception {
		return userInfoRepository.userInfoUpdate(updateUser);
	}
	
	@Override
	public UserInfo mainUserModify(UpdateUser updateUser) throws Exception {
		return userInfoRepository.mainUserInfoUpdate(updateUser);
	}

	@Override
	public List<UserInfo> userListAll(String companyCode) throws Exception {
		return userInfoRepository.userInfoSelectAll(companyCode);
	}

	@Override
	public int userListModify(UserInfo userInfo) throws Exception {
		return userInfoRepository.userListUpdate(userInfo);
	}

	@Override
	public int newUserAdd(UserInfo newUserInfo) throws Exception {
		return userInfoRepository.newUserInsert(newUserInfo);
	}

	@Override
	public int removeUser(String deleteId) throws Exception {
		return userInfoRepository.deleteUser(deleteId);
	}

	@Override
	public List<UserInfo> searchUser(String userName) throws Exception {
		return userInfoRepository.searchData(userName);
	}


	@Override
	public UserInfo updateUserInfo(String id) throws Exception {
		return userInfoRepository.updateUserSelect(id);
	}

	@Override
	public UserInfo checkDuplicateUserId(String updateId) throws Exception {
		return userInfoRepository.checkDuplicateUserId(updateId);
	}

	@Override
	public int userAdminRollUpdate(AdminRollUser adminRollUser) throws Exception {
		
		return userInfoRepository.userAdminRollUpdate(adminRollUser);
	}

}
