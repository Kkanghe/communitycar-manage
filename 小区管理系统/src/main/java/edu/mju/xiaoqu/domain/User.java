package edu.mju.xiaoqu.domain;


public class User extends ValueObject {
	
	private String userNo;
	private String userPwd;
	private String userName;
	
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", userPwd=" + userPwd + ", userName=" + userName + "]";
	}
	
	

}
