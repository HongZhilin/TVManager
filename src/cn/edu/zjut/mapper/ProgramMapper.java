package cn.edu.zjut.mapper;

import java.util.List;

import cn.edu.zjut.entity.Page;
import cn.edu.zjut.util.PageData;

public interface ProgramMapper {
	
	List<PageData> programlistPage(Page page);
}
