package com.yeonoo.sfow.basicinfo.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yeonoo.sfow.basicinfo.domain.AdminRollUser;
import com.yeonoo.sfow.basicinfo.domain.UpdateUser;
import com.yeonoo.sfow.basicinfo.domain.UserInfo;

import lombok.RequiredArgsConstructor;


@Repository
@RequiredArgsConstructor
public class UserInfoRepositoryImpl implements UserInfoRepository{

	private final SqlSession sqlSession;
	
	//사용자 정보 확인
	@Override
	public UserInfo userInfoSelect(int no) throws Exception {
		UserInfo userInfo=sqlSession.selectOne("mapper.userInfo.userInfoSelect",no);
		return userInfo;
	}

	//로그인 검사
	@Override
	public UserInfo userValidate(UserInfo userInfo) throws Exception {
		UserInfo loginUser=sqlSession.selectOne("mapper.userInfo.userLogin",userInfo);
		return loginUser;
	}

	//사용자 정보 변경
	@Override
	public UserInfo userInfoUpdate(UpdateUser updateUser) throws Exception {
		int result = sqlSession.update("mapper.userInfo.updateUserInfo",updateUser);
		if(result==1) {
		String id = updateUser.getId();
		UserInfo generalUserInfo = sqlSession.selectOne("mapper.userInfo.generalUserInfo", id);
		return generalUserInfo;
		} else {
			return null;
		}
	}
	
	//메인 관리자 정보 수정
	@Override
	public UserInfo mainUserInfoUpdate(UpdateUser updateUser) throws Exception {
		int result = sqlSession.update("mapper.userInfo.mainUserInfoUpdate",updateUser);
		if(result==1) {
			String id = updateUser.getId();
			UserInfo mainUserInfo = sqlSession.selectOne("mapper.userInfo.mainUserInfo", id);
			return mainUserInfo;
		} else {
			return null;
		}
	}

	//사용자 목록 조회
	@Override
	public List<UserInfo> userInfoSelectAll(String companyCode) throws Exception {
		List<UserInfo> userInfoList =sqlSession.selectList("mapper.userInfo.userInfoSelectAll",companyCode);
		return userInfoList;
	}

	//사용자 계정 관리 - 수정
	@Override
	public int userListUpdate(UserInfo userInfo) throws Exception {
		int result=sqlSession.update("mapper.userInfo.userListUpdate",userInfo);
		return result;
	}
	
	//그리드 행 추가
	@Override
	public int newUserInsert(UserInfo newUserInfo) throws Exception {
		int result=sqlSession.insert("mapper.userInfo.newUserAdd",newUserInfo);
		return result;
	}
	
	//그리드 행 삭제
	@Override
	public int deleteUser(String deleteId) throws Exception {
		int result=sqlSession.delete("mapper.userInfo.deleteUser",deleteId);
		return result;
	}

	
	//유저 이름 검색
	@Override
	public List<UserInfo> searchData(String userName) throws Exception {
		List<UserInfo> list = sqlSession.selectList("mapper.userInfo.searchData",userName);
		return list;
	}

	
	//로그인 사용자 데이터 조회
	@Override
	public UserInfo updateUserSelect(String id) throws Exception {
			UserInfo userInfo=sqlSession.selectOne("mapper.userInfo.updateUserSelect",id);
		return userInfo;
	}

	
	//유저 ID 중복 검사
	@Override
	public UserInfo checkDuplicateUserId(String updateId) throws Exception {
		UserInfo userInfo=sqlSession.selectOne("mapper.userInfo.checkDuplicate",updateId);
		return userInfo;
	}

	
	//관리자 권한 부여
	@Override
	public int userAdminRollUpdate(AdminRollUser adminRollUser) throws Exception {
		int result =sqlSession.update("mapper.userInfo.userAdminRollUpdate",adminRollUser);
		return result;
	}

	
	
}
