package cn.edu.zjut.service;

import java.util.List;

import cn.edu.zjut.entity.Page;
import cn.edu.zjut.util.PageData;

/** 
 * @author  作者 E-mail: 
 * @date 创建时间：2016年1月5日 下午12:04:39 
 * @version 1.0 
 * @parameter  
 * @since  
 * @return  
 */
public interface BusinessService {
	
	/*每日节目榜单*/
	List<PageData> getTopNPie(PageData pd);
	
	/*每日热门节目榜单*/
	List<PageData> getProvinceHeat();

}
