package cn.edu.zjut.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.edu.zjut.mapper.ShowMapper;
import cn.edu.zjut.service.ShowService;
import cn.edu.zjut.util.PageData;

public class ShowServiceImpl implements ShowService {
	
	@Autowired
	private ShowMapper showMapper;
	
	public List<PageData> provinceheat() {
		return showMapper.provinceheat();
	
	}

}
