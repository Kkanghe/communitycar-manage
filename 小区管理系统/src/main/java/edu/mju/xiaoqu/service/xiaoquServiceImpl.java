package edu.mju.xiaoqu.service;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import edu.mju.xiaoqu.dao.xiaoquDao;
import edu.mju.xiaoqu.domain.xiaoqu;
@Service
public class xiaoquServiceImpl implements xiaoquService {
@Autowired
private xiaoquDao xiaoquDao = null;

	public void regxiaoqu(xiaoqu qu) {
		// TODO 自动生成的方法存根
    xiaoquDao.addxiaoqu(qu);
	}

	public List<xiaoqu> loadxiaoqu() {
		// TODO 自动生成的方法存根
		return xiaoquDao.loadxiaoqu();
	}

	public void removexiaoqu(int xiaoqunum) {
		// TODO 自动生成的方法存根
		xiaoquDao.delxiaoqu(xiaoqunum);

	}

	public xiaoqu getxiaoquByNo(int xiaoqunum) {
		// TODO 自动生成的方法存根
		return xiaoquDao.getxiaoquByNo(xiaoqunum);
	}

	public void updatexiaoqu(xiaoqu qu) {
		// TODO 自动生成的方法存根
		xiaoquDao.updatexiaoqu(qu);

	}

	public byte[] getxiaoquPicByNo(int xiaoqunum) {
		// TODO 自动生成的方法存根
    Map picMap = xiaoquDao.getxiaoquPicByNo(xiaoqunum);
		
		if(picMap!=null){
			return (byte[])picMap.get("imgBytes");
		}
		
		return null;
		
	}

}
