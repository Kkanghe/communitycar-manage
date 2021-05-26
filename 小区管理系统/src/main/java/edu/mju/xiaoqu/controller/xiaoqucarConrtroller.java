package edu.mju.xiaoqu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import edu.mju.xiaoqu.domain.xiaoqu;
import edu.mju.xiaoqu.domain.xiaoqucar;
import edu.mju.xiaoqu.service.carQueryHelp;
import edu.mju.xiaoqu.service.xiaoquService;
import edu.mju.xiaoqu.service.xiaoqucarService;
import edu.mju.xiaoqu.util.Page;

@Controller
public class xiaoqucarConrtroller {
	@Autowired
	private xiaoqucarService xiaoqucarservice = null;
	@PostMapping("/xiaoqucar/save")
	public String createcar(xiaoqucar car) throws Exception{
		xiaoqucarservice.regxiaoqucar(car);	
		return "redirect:/loadxiaoqucar";
	}

	@GetMapping("/loadxiaoqucar")
	public String loadxiaoqucar(Model model,carQueryHelp helper,Page page) throws Exception{
		page = xiaoqucarservice.loadPagedcar(helper, page);
		model.addAttribute("page", page); //往model中存入数据，就是以key/value形式保存数据到请求范围
		model.addAttribute("helper", helper);
		return "list_xiaoqucar";
	}
	@DeleteMapping("/removecar/{carnum}")
	public String removexiaoqu(@PathVariable String carnum) throws Exception{
		

		xiaoqucarservice.delxiaoqucar(carnum);
		
		return "redirect:/loadxiaoqucar";
		
	}
	@GetMapping("/updatecar/{carnum}")
	public String preUpdate(@PathVariable String carnum,Model model) throws Exception{
				
		return "update_xiaoqucar";
		
	}
	@PostMapping("/updatecar/{carnum}")
	public String updatexiaoqucar(xiaoqucar car, @PathVariable String carnum) throws Exception{
		car.setCarnum(carnum);
		
		xiaoqucarservice.updatexiaoqucar(car);
		
		return "redirect:/loadxiaoqucar";
		
	}

}
