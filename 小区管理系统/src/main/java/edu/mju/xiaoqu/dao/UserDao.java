/**
 * 
 */
package edu.mju.xiaoqu.dao;

import edu.mju.xiaoqu.domain.User;

/**
 * @author joeyang ong
 *
 */
public interface UserDao {
	
	User getUserByNo(String userNo);

	void addUser(User user); 

}
