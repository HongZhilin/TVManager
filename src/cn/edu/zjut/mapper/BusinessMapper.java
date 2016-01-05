package cn.edu.zjut.mapper;

import java.util.List;

import cn.edu.zjut.entity.Page;
import cn.edu.zjut.util.PageData;


public interface BusinessMapper {
	/*每日节目榜单*/
	List<PageData> getTopNPie(PageData pd);
	
	/*每日热门节目榜单*/
	List<PageData> getProvinceHeat();
	

}
