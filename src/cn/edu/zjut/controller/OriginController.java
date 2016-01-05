package cn.edu.zjut.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.zjut.service.OriginService;
import cn.edu.zjut.util.PageData;

/** 
 * @author  作者 E-mail: 
 * @date 创建时间：2016年1月4日 下午7:37:42 
 * @version 1.0 
 * @parameter  
 * @since  
 * @return  
 */
@Controller
@RequestMapping(value="/origin")
public class OriginController extends BaseController {
	@Autowired
	private OriginService originService;
		
	@RequestMapping(value="/topN")
	public ModelAndView toTopNView(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("service/topN");
		return mv;		
	}
	
	@RequestMapping(value="/getTopN")
	public @ResponseBody List<PageData> getTopN(){
		List<PageData> topN = null;
		try{
			topN=originService.getTopN();
		}catch(Exception e){
			logger.error(e.toString(),e);
		}
		return topN;		
	}
	
	
}
