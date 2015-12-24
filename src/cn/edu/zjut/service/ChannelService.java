package cn.edu.zjut.service;

import java.util.List;

import cn.edu.zjut.entity.Page;
import cn.edu.zjut.util.PageData;

public interface ChannelService {

	List<PageData> list(Page page);
	
	List<String> provincelist( );
	
	List<String> findByProvinceName(PageData pd);
	
	void delete(PageData pd);

	/*
	* 通id获取数据
	*/
	public PageData findById(PageData pd);

	void save(PageData pd);
	
	void edit(PageData pd);
	
	
	
}
