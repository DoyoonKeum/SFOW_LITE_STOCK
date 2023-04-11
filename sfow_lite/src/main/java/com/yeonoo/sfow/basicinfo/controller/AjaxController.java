package com.yeonoo.sfow.basicinfo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.yeonoo.sfow.basicinfo.domain.AdminRollUser;
import com.yeonoo.sfow.basicinfo.domain.UpdateUser;
import com.yeonoo.sfow.basicinfo.domain.UserInfo;
import com.yeonoo.sfow.basicinfo.service.UserInfoService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@Controller
@RequiredArgsConstructor
public class AjaxController {
	
	private final UserInfoService userInfoService;
	
	
	//회원정보 수정
	@PostMapping("/updateUserAjax")
	@Transactional(rollbackFor = Exception.class)
	public @ResponseBody UserInfo updateUser(UpdateUser updateUser,HttpSession session) throws Exception {
		
		UserInfo generalUserInfo = userInfoService.userInfoModify(updateUser);
		
		UserInfo mainUserInfo = userInfoService.mainUserModify(updateUser);
		
		if(generalUserInfo!=null) {
			return generalUserInfo;
		} else if(mainUserInfo!=null) {
			return mainUserInfo;
		}
		return null;
		
	}
	// 개인정보 조회
	@RequestMapping("/userInfoAjax")
	public UserInfo userInfoAjax(String id) throws Exception {
		UserInfo userInfo=userInfoService.updateUserInfo(id);
		return userInfo;
	}
	
	
	// 회원 목록 조회
	@RequestMapping("/userManagementAjax")
	public List<UserInfo> userManagementAjax(String companyCode) throws Exception {
		List<UserInfo> userInfoList =userInfoService.userListAll(companyCode);
		return userInfoList;
	}
 	
	
	
	// ID 중복 체크
	@RequestMapping(value = "/userListCheckDuplicate")
	public int userListCheckDuplicate(@RequestBody UserInfo updatedData) throws Exception {
		if(updatedData.getId() != null) {
			String updateId=updatedData.getId();
		    UserInfo userInfo=userInfoService.checkDuplicateUserId(updateId);
		    if(userInfo != null) {
		    	return 2;
		    } else if (userInfo == null){
		    	int result = userInfoService.userListModify(updatedData);
		    	return result;
		    }
		}
		return 2;
	}
	
	
	//계정 정보 수정
	@RequestMapping(value = "/userListUpdate")
	public int userListUpdate(@RequestBody UserInfo updatedData) throws Exception {
		int result = userInfoService.userListModify(updatedData);
	    return result;
	}
	
	//새로운 유저 생성
	@RequestMapping("/newUserAjax")
	public String newUserAdd(@RequestBody UserInfo newUserData) throws Exception {
		
		int result=userInfoService.newUserAdd(newUserData);
		return "1";
	}

	
	//계정 삭제
	@RequestMapping("/deleteUserAjax")
	public String deleteUserAjax(@RequestBody List<String> updateKeys) throws Exception {
		 for (String updateKey : updateKeys) {
			    String deleteId = updateKey;
			if (deleteId.startsWith("\"") && deleteId.endsWith("\"")) {
				deleteId = deleteId.substring(1, deleteId.length() - 1);
			}
		int result = userInfoService.removeUser(deleteId);
		 }
	    return "1";
	}
	
	
	//검색
	@RequestMapping("/search")
	public List<UserInfo> searchUser(String keyword) throws Exception {
		List<UserInfo> searchUser=userInfoService.searchUser(keyword);
		if(searchUser!=null) {
			return searchUser;
		} else {
			return null;
		}
	}
	
	
	//관리자 권한 부여
	@RequestMapping("/userAdminRollUpdate")
	public int userAdminRollUpdate(@RequestBody AdminRollUser adminRollUser) throws Exception {
		int result=userInfoService.userAdminRollUpdate(adminRollUser);
		return result;
	}
	
	
	
	

	}
