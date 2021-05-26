package edu.mju.xiaoqu.domain;

import java.util.Arrays;

public class xiaoqu {
	private int xiaoqunum;
	private String xiaoquname;
	private String xiaoquadd;
	private int cartotal;
	private byte[] xiaoqupic;


	public int getxiaoqunum() {
		return xiaoqunum;
	}
	public void setxiaoqunum(int xiaoqunum) {
		this.xiaoqunum = xiaoqunum;
	}
	public int getcartotal() {
		return cartotal;
	}
	public void setcartotal(int cartotal) {
		this.cartotal = cartotal;
	}
	public String getxiaoquname() {
		return xiaoquname;
	}
	public void setxiaoquname(String xiaoquname) {
		this.xiaoquname = xiaoquname;
	}
	public String getxiaoquadd() {
		return xiaoquadd;
	}
	public void setxiaoquadd(String xiaoquadd) {
		this.xiaoquadd = xiaoquadd;
	}
	public byte[] getxiaoqupic() {
		return xiaoqupic;
	}
	public void setxiaoqupic(byte[] xiaoqupic) {
		this.xiaoqupic = xiaoqupic;
	}
	@Override
	public String toString() {
		return "xiaoqu [xiaoqunum=" + xiaoqunum + ", xiaoquname=" + xiaoquname + ", xiaoquadd=" + xiaoquadd+", cartotal=" + cartotal +"]";
	}
	
	
}
