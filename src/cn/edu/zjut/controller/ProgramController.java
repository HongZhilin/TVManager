package cn.edu.zjut.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.zjut.controller.BaseController;
import cn.edu.zjut.entity.Page;
import cn.edu.zjut.service.ProgramService;
import cn.edu.zjut.util.PageData;

@Controller
@RequestMapping(value="/program")
public class ProgramController extends BaseController{
	
	@Autowired
	private ProgramService programService;
	
	@RequestMapping(value="/list")
	public ModelAndView list(HttpSession session,Page page) throws Exception{
		logBefore(logger, "电视节目列表");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			//检索条件
			String provinceName = pd.getString("provinceName");
			String channelName = pd.getString("channelName");
			if(null!=provinceName && !"".equals(provinceName)){
				provinceName = provinceName.trim();
				pd.put("provinceName", provinceName);
			}
			if(null != channelName && !"".equals(channelName)){
				channelName = channelName.trim();
				pd.put("channelName", channelName);
			}
			page.setPd(pd);
			List<PageData> varList = programService.list(page);
			mv.setViewName("program/program_list");
			mv.addObject("varList",varList);
			mv.addObject("pd",pd);
		}catch(Exception e){
			logger.error(e.toString(),e);
		}
		return mv;
	}
	
	
}
