package cn.edu.zjut.mapper;

import java.util.List;

import cn.edu.zjut.util.PageData;

public interface ShowMapper {
	
	public List<PageData> provinceheat();

	public List<PageData> hourshow();

	public List<PageData> weekshow();

}
