package cn.edu.zjut.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.zjut.controller.BaseController;
import cn.edu.zjut.entity.Page;
import cn.edu.zjut.service.ChannelService;
import cn.edu.zjut.util.PageData;

@Controller
@RequestMapping(value="/channel")
public class ChannelController extends BaseController {

	@Resource(name="channelService")
	private ChannelService channelService;
	
	@RequestMapping(value="/getProvinceName")
	public @ResponseBody List<String> getProvinceName(){
		List<String> provinceList= channelService.provincelist();
		return provinceList;
	}
	
	@RequestMapping(value="/findByProvinceName",method= RequestMethod.POST)
	public @ResponseBody List<String> getChannelNameByProvinceName(){
		//String pName=Tools.encodeStr(provinceName);
		//tomat下 获取的数据乱码
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.putAll(getPageData());
		List<String> channelName= channelService.findByProvinceName(pd);
		return channelName;
	}
		
	/**
	 * 显示电视台列表
	 * @param model
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(HttpSession session,Page page) throws Exception{
		logBefore(logger, "电视台列表");
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
			List<PageData> varList = channelService.list(page);
			mv.setViewName("program/channel_list");
			mv.addObject("varList",varList);
			mv.addObject("pd",pd);
		}catch(Exception e){
			logger.error(e.toString(),e);
		}
		return mv;
	}

	/**
	 * 去新增页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/add")
	public ModelAndView toAdd(){
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("program/channel_info");
			mv.addObject("msg", "save");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/edit")
	public ModelAndView toEdit(){
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = channelService.findById(pd);
			mv.setViewName("program/channel_info");
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**
	 * 保存
	 */
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public ModelAndView save(PrintWriter out) throws Exception{
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.putAll(getPageData());
		channelService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		logger.info("保存电视台信息成功！");
		return mv;
	}
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public ModelAndView edit(PrintWriter out) throws Exception{
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.putAll(getPageData());
		channelService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		logger.info("保存电视台信息成功！");
		return mv;
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public void delete(PrintWriter out)throws Exception{
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			channelService.delete(pd);
			out.write("success");
			out.close();
			out.flush();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
	}
}
