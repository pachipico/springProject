package com.springprj.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.springprj.www.security.AuthVO;
import com.springprj.www.security.UserVO;


public interface UserDAO {
	int insertUser(UserVO uvo);
	int insertAuthInit(String email);
	int insertAuthManager(String email); //add
	int insertAuthAdmin(String email); // add
	UserVO selectOneUserByEmail(String email);
	String selectEmailByNameAndNickName(@Param("name") String name, @Param("nickName") String nickName);
	int selectNickNameCount(String nickName); // 중복확인
	UserVO selectOneUserByEmailAndPwd(@Param("email") String email,@Param("pwd") String pwd); // 로그인
	
	List<UserVO> selectUserList(String sortBy);
	List<AuthVO> selectAuths(String email);
	int selectPoint(String email);
	
	int updatePwd(@Param("email") String email, @Param("pwd") String pwd);
	int updateNickName(@Param("email") String email , @Param("nickName") String nickName);
	int updatePointUp(@Param("email") String email, @Param("point") int point);
	int updatePointDown(@Param("email") String email, @Param("point") int point);
	int updateProfileImg(@Param("email") String email, @Param("img") String img);
	int updateSlang(@Param("email") String email , @Param("value") int value);
	int updateAdult(@Param("email") String email , @Param("value") int value);
	int updateLastLogin(String email);
	int updateFontColor(@Param("email") String email, @Param("color") String color);
	int updateGrade(@Param("email") String email, @Param("grade") int grade);
	
	int deleteUser(@Param("email") String email,@Param("pwd") String pwd);
	
}
