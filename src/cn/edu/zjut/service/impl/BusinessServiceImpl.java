package cn.edu.zjut.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.edu.zjut.entity.Page;
import cn.edu.zjut.mapper.BusinessMapper;
import cn.edu.zjut.service.BusinessService;
import cn.edu.zjut.util.PageData;

/** 
 * @author  作者 E-mail: 
 * @date 创建时间：2016年1月5日 下午12:04:58 
 * @version 1.0 
 * @parameter  
 * @since  
 * @return  
 */
public class BusinessServiceImpl implements BusinessService {
	@Autowired
	private BusinessMapper businessMapper;

	public List<PageData> getTopNPie(PageData pd) {
		return businessMapper.getTopNPie(pd);
	}

	public List<PageData> getProvinceHeat() {
		return businessMapper.getProvinceHeat();
	}

}
