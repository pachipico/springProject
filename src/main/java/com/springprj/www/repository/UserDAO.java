package com.springprj.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.springprj.www.security.AuthVO;
import com.springprj.www.security.UserVO;


public interface UserDAO {
	int insertUser(UserVO uvo);
	int insertAuthInit(String email);
	UserVO selectEmail(String email);
	
	List<UserVO> selectUserList();
	List<AuthVO> selectAuths(String email);
	int selectPoint(String email);
	
	int updateLastLogin(String email);
	int updatePwd(@Param("email") String email, @Param("pwd") String pwd);
	int updateNickName(@Param("email") String email , @Param("nickname") String nickname);
	int updatePoint(@Param("email") String email, @Param("point") int point);
	int updateProfileImg(@Param("email") String email, @Param("img") String img);
	int updateSlang(@Param("email") String email , @Param("value") boolean value);
	int updateAdult(@Param("email") String email , @Param("value") boolean value);
	int updateFontColor(@Param("email") String email, @Param("color") String color);
	int updateGrade(@Param("email") String email, @Param("grade") int grade);
	
	int deleteUser(@Param("email") String email,@Param("pwd") String pwd);
	
}
