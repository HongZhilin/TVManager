package cn.edu.zjut.service.impl;

import java.util.List;

import cn.edu.zjut.entity.Info;
import cn.edu.zjut.entity.Page;
import cn.edu.zjut.mapper.InfoMapper;
import cn.edu.zjut.service.InfoService;

public class InfoServiceImpl implements InfoService{

	private InfoMapper infoMapper;
	
//	public List<Info> list(Page page) {
//		return infoMapper.list(page);
//	}
	
	public List<Info> infolistPage(Page page) {
		return infoMapper.infolistPage(page);
	}
	
	public InfoMapper getInfoMapper() {
		return infoMapper;
	}

	public void setInfoMapper(InfoMapper infoMapper) {
		this.infoMapper = infoMapper;
	}
}
