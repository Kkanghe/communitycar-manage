/**
 * 
 */
package edu.mju.xiaoqu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import edu.mju.xiaoqu.dao.UserDao;
import edu.mju.xiaoqu.domain.User;


@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;

	/* (non-Javadoc)
	 * @see edu.mju.stuwork.service.UserService#getUserByNo(java.lang.String)
	 */
	@Override
	public User getUserByNo(String userNo) {
	   return userDao.getUserByNo(userNo);	
	}
	@Override
	public void regUser(User user) {
		
		
		userDao.addUser(user);

	}

}
