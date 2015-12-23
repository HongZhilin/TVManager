package cn.edu.zjut.service;

import java.util.List;

import cn.edu.zjut.entity.Info;
import cn.edu.zjut.entity.Page;

public interface InfoService {
//	List<Info> list(Page page);
	
	List<Info> infolistPage(Page page);
}
