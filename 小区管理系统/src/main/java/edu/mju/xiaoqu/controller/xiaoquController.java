package edu.mju.xiaoqu.controller;
import java.io.FileInputStream;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import edu.mju.xiaoqu.service.xiaoquService;
import edu.mju.xiaoqu.service.xiaoqucarService;
import edu.mju.xiaoqu.domain.xiaoqu;
import edu.mju.xiaoqu.domain.xiaoqucar;
@Controller
public class xiaoquController {
	@Autowired
private xiaoquService xiaoquservice = null;
@PostMapping("/xiaoqu")
public String createxiaoqu(xiaoqu qu,MultipartFile quphoto) throws Exception{
	
	qu.setxiaoqupic(quphoto.getBytes());
	
	xiaoquservice.regxiaoqu(qu);
	
	return "redirect:/loadxiaoqu";
	
}
@GetMapping("/loadxiaoqu")
public String loadxiaoqu(Model model) throws Exception{
	List<xiaoqu> xiaoquList = xiaoquservice.loadxiaoqu();
	model.addAttribute("xiaoquList", xiaoquList); //往model中存入数据，就是以key/value形式保存数据到请求范围
	return "list_xiaoqu";
	
}
@GetMapping("/update/{xiaoqunum}")
public String preUpdate(@PathVariable int xiaoqunum,Model model) throws Exception{
	

	xiaoqu qu = xiaoquservice.getxiaoquByNo(xiaoqunum);
	
	model.addAttribute("xiaoqu",xiaoqunum);
	
	return "update_xiaoqu";
	
}

@PostMapping("/update/{xiaoqunum}")
public String updatexiaoqu(xiaoqu qu,MultipartFile quphoto, @PathVariable int xiaoqunum) throws Exception{
	qu.setxiaoqunum(xiaoqunum);

	if(quphoto.getBytes()!=null && quphoto.getBytes().length>0)
		qu.setxiaoqupic(quphoto.getBytes());
	else
		qu.setxiaoqupic(xiaoquservice.getxiaoquPicByNo(xiaoqunum));
	
	xiaoquservice.updatexiaoqu(qu);
	
	return "redirect:/loadxiaoqu";
	
}
@DeleteMapping("/remove/{xiaoqunum}")
public String removexiaoqu(@PathVariable int xiaoqunum) throws Exception{
	

	xiaoquservice.removexiaoqu(xiaoqunum);
	
	return "redirect:/loadxiaoqu";
	
}

@GetMapping("/xiaoqu/{xiaoqunum}/photo")
public String getxiaoquPicByNo(@PathVariable int xiaoqunum, 
		                    HttpServletRequest request,
		                    HttpServletResponse response) throws Exception{
	
	byte[] data = xiaoquservice.getxiaoquPicByNo(xiaoqunum);
//	System.out.println(data.length);
	
	//无法从服务器获得数据
	if(data==null || data.length==0){
		//网址路径转成物理路径
		String imgFilePath = request.getRealPath("/")+"/resources/pics/shit.png";
		//System.out.println(imgFilePath);
		FileInputStream fis = new FileInputStream(imgFilePath);
		data = new byte[fis.available()];
		fis.read(data);
		fis.close();
	}
	
	response.setContentType("image/jpeg"); //MIME
	ServletOutputStream oss = response.getOutputStream();
	oss.write(data);
	oss.flush();
	oss.close();
	
	
	return null;
	
}


}
