package edu.mju.xiaoqu.service;

import java.util.List;

import edu.mju.xiaoqu.domain.xiaoqu;


public interface xiaoquService {
	void regxiaoqu(xiaoqu qu);
	List<xiaoqu> loadxiaoqu();
	void removexiaoqu(int xiaoqunum);
	xiaoqu getxiaoquByNo(int xiaoqunum);
	void updatexiaoqu(xiaoqu qu);
	byte[] getxiaoquPicByNo(int xiaoqunum);
}
