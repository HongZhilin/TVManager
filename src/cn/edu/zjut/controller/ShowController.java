package cn.edu.zjut.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.zjut.service.ShowService;
import cn.edu.zjut.util.PageData;

@Controller
@RequestMapping(value="/show")
public class ShowController extends BaseController {
	
	@Autowired
	private ShowService showService;
		
	@RequestMapping(value="/provinceH")
	public ModelAndView toProvinceHView(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("show/provinceheat");
		return mv;		
	}
	
	@RequestMapping(value="/getProvinceH")
	public @ResponseBody List<PageData> getProvinceH(){
		List<PageData> provinceH = null;
		try{
			provinceH=showService.provinceheat();
		}catch(Exception e){
			logger.error(e.toString(),e);
		}
		return provinceH;		
	}
	
	
}
