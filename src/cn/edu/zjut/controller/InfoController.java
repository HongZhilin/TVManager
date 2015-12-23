package cn.edu.zjut.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.zjut.controller.BaseController;
import cn.edu.zjut.entity.Info;
import cn.edu.zjut.entity.Page;
import cn.edu.zjut.service.InfoService;

@Controller
@RequestMapping(value="/info")
public class InfoController extends BaseController{
	
	@Autowired
	private InfoService infoService;
	
	@RequestMapping(value="list")
	public String info(Model model,Page page){
		List<Info> infoList = infoService.infolistPage(page);
		model.addAttribute("infoList", infoList);
		model.addAttribute("page", page);
		return "info_list";
		
	}

	/*@RequestMapping(value="/list")
	public ModelAndView list(HttpSession session, Page page) throws Exception{
		logBefore(logger, "info列表");
		ModelAndView mv = new ModelAndView();
		try{
			List<PageData>	infoList = infoService.list(page);
			mv.setViewName("info_list");
			mv.addObject("infoList", infoList);
			mv.addObject("page",page);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}*/

}
