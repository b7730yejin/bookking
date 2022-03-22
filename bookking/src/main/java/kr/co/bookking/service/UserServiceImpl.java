package kr.co.bookking.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.annotation.Persistent;
import org.springframework.stereotype.Service;

import kr.co.bookking.VO.UserVO;
import kr.co.bookking.dao.UserDAO;
import kr.co.bookking.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserDAO userDao;
	
	@Autowired
	UserRepository ur;
	
	//회원가입
	@Override
	public int signup(UserVO user) throws Exception {
		return userDao.signup(user);
	}

	//중복확인
	@Override
	public String isDuplication(String userId) throws Exception {
		return userDao.isDuplication(userId);
	}

	//로그인
	@Override
	public String login(String userId, String userPw) throws Exception {
		return ur.findByUserIdAndUserPassword(userId, userPw).getUserId();
//		Map<String, String> params = new HashMap<String, String>();
//		params.put("userId", userId);
//		params.put("userPassword", userPw);
//		return userDao.login(params);
	}

	/* 사용자 정보 가져오기*/
	@Override
	public UserVO getUserInfo(String userId) throws Exception {
		return userDao.getUserInfo(userId);
	}

	@Override
	public int changeUserInfo(UserVO userVO) throws Exception {
		return userDao.changeUserInfo(userVO);
	}
	
	@Override
	public int changeUserPassword(Map<String, Object> params) throws Exception {
		return userDao.changeUserPassword(params);
	}
	
	@Override
	public String getUserPassword(String userId) throws Exception {
		return userDao.getUserPassword(userId);
	}
}
