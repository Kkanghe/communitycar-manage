package edu.mju.xiaoqu.dao;

import java.util.Collection;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import edu.mju.xiaoqu.domain.xiaoqu;
import edu.mju.xiaoqu.domain.xiaoqucar;
import edu.mju.xiaoqu.service.carQueryHelp;

public interface xiaoqucarDao {
	   void addxiaoqucar(xiaoqucar car);
	   List<xiaoqucar> loadxiaoqucar();
	   void delxiaoqucar(String carnum);
	   void updatecar(xiaoqucar car);
	   List<xiaoqucar> loadxiaoqucars(carQueryHelp helper);
	   long cntcarByCondition(carQueryHelp helper);
	   List<xiaoqucar> loadScopedcarByCondition(@Param("helper") carQueryHelp helper, 
									        	@Param("begin") int beginIdx, 
									        	@Param("size") int pageSize);
}
