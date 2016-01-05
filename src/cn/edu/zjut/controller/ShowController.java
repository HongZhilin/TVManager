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
	
	/**
	 * 进入省份最火节目页面
	 * @return
	 */
	@RequestMapping(value="/provinceH")
	public ModelAndView toProvinceHView(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("show/province_favourite");
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
	
	/**
	 * 进入24小时收视统计页面
	 * @return
	 */
	@RequestMapping(value="/hoursH")
	public ModelAndView toHoursHView(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("show/hour_statistics");
		return mv;		
	}
	
	@RequestMapping(value="/getHoursH")
	public @ResponseBody List<PageData> getHoursH(){
		List<PageData> hoursH = null;
		try{
			hoursH=showService.hourshow();
		}catch(Exception e){
			logger.error(e.toString(),e);
		}
		return hoursH;		
	}
	
	/**
	 * 进入一周收视统计页面
	 * @return
	 */
	@RequestMapping(value="/weekView")
	public ModelAndView toWeekView(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("show/week_statistics");
		return mv;		
	}
	
	@RequestMapping(value="/getWeekView")
	public @ResponseBody List<PageData> getWeekView(){
		List<PageData> weekView = null;
		try{
			weekView=showService.weekshow();
		}catch(Exception e){
			logger.error(e.toString(),e);
		}
		return weekView;		
	}
	
	
}
