package cn.edu.zjut.service;

import java.util.List;

import cn.edu.zjut.entity.Page;
import cn.edu.zjut.util.PageData;

public interface ProgramService {
	
	List<PageData> list(Page page);
}
