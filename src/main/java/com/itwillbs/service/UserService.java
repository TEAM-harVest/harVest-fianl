package com.itwillbs.service;

import com.itwillbs.domain.UserDTO;

public interface UserService {
	
//	[회원가입]
	public void insertUser(UserDTO userDto);
	
//	[로그인]
	public UserDTO userCheck(UserDTO userDto);
	
//	[회원 정보 가져오기]
	public UserDTO getUser(String id);
	
//	[비밀번호 가져오기]
	public UserDTO passCheck(UserDTO userDto);
	
//		
	
	
}
