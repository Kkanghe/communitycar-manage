package edu.mju.xiaoqu.dao;
import java.util.List;
import java.util.Map;
import edu.mju.xiaoqu.domain.xiaoqu;
public interface xiaoquDao {
	 void addxiaoqu(xiaoqu qu);
	   List<xiaoqu> loadxiaoqu();
	   void delxiaoqu(int xiaoqunum);
	   xiaoqu getxiaoquByNo(int xiaoqunum);
	   void updatexiaoqu(xiaoqu qu);
	   Map getxiaoquPicByNo(int xiaoqunum);
}
