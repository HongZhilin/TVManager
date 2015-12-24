package cn.edu.zjut.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.edu.zjut.entity.Page;
import cn.edu.zjut.mapper.ChannelMapper;
import cn.edu.zjut.service.ChannelService;
import cn.edu.zjut.util.PageData;

public class ChannelServiceImpl implements ChannelService{
	
	@Autowired
	private ChannelMapper channelMapper;

	public List<PageData> list(Page page) {
		return channelMapper.channellistPage(page);
	}

	public List<String> provincelist( ){
		return channelMapper.provincelist();
	}

	public List<String> findByProvinceName(PageData pd) {
		return channelMapper.findByProvinceName(pd);
	}

	public void delete(PageData pd) {
		channelMapper.delete(pd);
	}

	public PageData findById(PageData pd) {
		return channelMapper.findById(pd);
	}

	public void save(PageData pd) {
		channelMapper.save(pd);
	}
	
	public void edit(PageData pd) {
		channelMapper.edit(pd);
	}
	
	//--------------------------------------------------------
	
	/*public ChannelMapper getChannelMapper() {
		return channelMapper;
	}

	public void setChannelMapper(ChannelMapper channelMapper) {
		this.channelMapper = channelMapper;
	}*/

}
