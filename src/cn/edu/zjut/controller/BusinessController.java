package cn.edu.zjut.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.zjut.service.BusinessService;
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
@RequestMapping(value="/business")
public class BusinessController extends BaseController {
	@Autowired
	private BusinessService businessService;
		
	@RequestMapping(value="/topNPie")
	public ModelAndView toTopNView(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("business/topNPie");
		return mv;		
	}
	
	@RequestMapping(value="/getTopNPieData")
	public @ResponseBody List<PageData> getTopN(){
		List<PageData> topN = null;
		try{
			PageData pd = new PageData();
			pd = this.getPageData();
			pd.putAll(getPageData());
			topN=businessService.getTopNPie(pd);
		}catch(Exception e){
			logger.error(e.toString(),e);
		}
		return topN;		
	}
	
	
	@RequestMapping(value="/topDayCloud")
	public ModelAndView toTopDayCloudView(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("business/topDayCloud");
		return mv;		
	}
	
	
	@RequestMapping(value="/provinceHeat")
	public ModelAndView toProvinceHeatView(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("business/provinceHeat");
		return mv;		
	}
	@RequestMapping(value="/getProvinceHeatData")
	public @ResponseBody List<PageData> getTopDayCloudData(){
		List<PageData> provinceHeat = null;
		try{
			provinceHeat=businessService.getProvinceHeat();
		}catch(Exception e){
			logger.error(e.toString(),e);
		}
		return provinceHeat;		
	}
	
	
}
