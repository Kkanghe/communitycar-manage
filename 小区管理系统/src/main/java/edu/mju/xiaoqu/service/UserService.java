/**
 * 
 */
package edu.mju.xiaoqu.service;

import edu.mju.xiaoqu.domain.User;

/**
 * @author joeyang ong
 *
 */
public interface UserService {
	
	User getUserByNo(String userNo);

	void regUser(User user) ;

}
