package edu.mju.xiaoqu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.mju.xiaoqu.dao.xiaoquDao;
import edu.mju.xiaoqu.dao.xiaoqucarDao;
import edu.mju.xiaoqu.domain.xiaoqucar;
import edu.mju.xiaoqu.util.Page;
@Service
public class xiaoqucarServiceImpl implements xiaoqucarService {
	@Autowired
	private xiaoqucarDao xiaoqucarDao = null;
	public void regxiaoqucar(xiaoqucar car) {
		// TODO Auto-generated method stub
		xiaoqucarDao.addxiaoqucar(car);
	}

	public List<xiaoqucar> loadxiaoqucar() {
		// TODO Auto-generated method stub
		
		return xiaoqucarDao.loadxiaoqucar();
	}
	public void delxiaoqucar(String carnum) {
		// TODO Auto-generated method stub
		xiaoqucarDao.delxiaoqucar(carnum);
	}
	public void updatexiaoqucar(xiaoqucar car) {
		xiaoqucarDao.updatecar(car);
	}

	public List<xiaoqucar> loadxiaoqucar(carQueryHelp helper) {
		// TODO Auto-generated method stub
		return xiaoqucarDao.loadxiaoqucars(helper);
	}

	public Page loadPagedcar(carQueryHelp helper, Page page) {
		page.setTotalRecNum(xiaoqucarDao.cntcarByCondition(helper));
		page.setPageContent(xiaoqucarDao.loadScopedcarByCondition(helper, page.getStartIndex(), page.getPageSize()));
		return page;
	}

		

}
