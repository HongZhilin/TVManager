package cn.edu.zjut.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.edu.zjut.mapper.OriginMapper;
import cn.edu.zjut.service.OriginService;
import cn.edu.zjut.util.PageData;

/** 
 * @author  作者 E-mail: 
 * @date 创建时间：2016年1月4日 下午7:35:05 
 * @version 1.0 
 * @parameter  
 * @since  
 * @return  
 */
public class OriginServiceImpl implements OriginService {
	@Autowired
	private OriginMapper originMapper;
	public List<PageData> getTopN() {
		
		return originMapper.getTopN();
	}

}
