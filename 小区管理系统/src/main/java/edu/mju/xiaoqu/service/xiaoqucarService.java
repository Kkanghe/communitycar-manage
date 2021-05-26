package edu.mju.xiaoqu.service;

import java.util.List;

import edu.mju.xiaoqu.domain.xiaoqu;
import edu.mju.xiaoqu.domain.xiaoqucar;
import edu.mju.xiaoqu.util.Page;

public interface xiaoqucarService {
	void regxiaoqucar(xiaoqucar car);
	List<xiaoqucar> loadxiaoqucar();
	List<xiaoqucar> loadxiaoqucar(carQueryHelp helper);
	void delxiaoqucar(String carnum);
	void updatexiaoqucar(xiaoqucar car);
	Page loadPagedcar(carQueryHelp helper,Page page);
}
