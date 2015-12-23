package cn.edu.zjut.mapper;

import java.util.List;

import cn.edu.zjut.entity.Info;
import cn.edu.zjut.entity.Page;

public interface InfoMapper {
//	List<Info> list(Page page);
	
	List<Info> infolistPage(Page page);

}
