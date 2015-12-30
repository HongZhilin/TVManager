package cn.edu.zjut.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.zjut.controller.BaseController;
import cn.edu.zjut.entity.Page;
import cn.edu.zjut.service.ProgramService;
import cn.edu.zjut.util.PageData;
import cn.edu.zjut.view.ProgramExcelView;

@Controller
@RequestMapping(value="/program")
public class ProgramController extends BaseController{
	
	@Autowired
	private ProgramService programService;
	
	private final Logger log = LoggerFactory.getLogger(ProgramController.class);
	
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
	
	/**
	 * 去新增页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/toAddView")
	public ModelAndView toAdd(){
		ModelAndView mv = new ModelAndView();
		/*PageData pd = new PageData();
		pd = this.getPageData();*/
		try {
			mv.setViewName("program/program_info");
			mv.addObject("msg","save");
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	/**
	 * 去修改页面
	 */
	@RequestMapping(value="/toEditView")
	public ModelAndView toEdit(){
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = programService.findProgramById(pd);
			mv.setViewName("program/program_info");
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
		programService.saveProgram(pd);
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
		programService.editProgram(pd);
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
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			programService.deleteProgramById(pd);
			out.write("success");
			out.close();
			out.flush();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
	}
	
	/**
	 * 批量删除
	 * @return
	 * @throws 
	 */
	@RequestMapping("/deletePrograms")
	public String deletePrograms(Integer[] id) {
		try{		
			programService.deletePrograms(id);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return "redirect:/program/list.html";

	}
	
	@RequestMapping("/export2Excel")
	public ModelAndView export2Excel(Page page) {
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		//电视台名称 	省份 	电视台编码 	节目名称 	开始时间 	结束时间 	持续时间（s） 	
		titles.add("电视台名称 ");
		titles.add("省份");
		titles.add("电视台编码");
		titles.add("节目名称 ");
		titles.add("开始时间  ");	
		titles.add("结束时间  ");		
		titles.add("持续时间（s）");
		dataMap.put("titles", titles);	
		
		List<PageData> programList = programService.list(page);
		
		dataMap.put("programList", programList);
		ProgramExcelView pev = new ProgramExcelView();
		ModelAndView mv = new ModelAndView(pev,dataMap);
		log.info("导出用户观看电视节目信息到Excel表成功");
		return mv;

	}
	
}
