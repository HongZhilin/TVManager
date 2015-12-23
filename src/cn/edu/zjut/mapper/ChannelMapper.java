package cn.edu.zjut.mapper;

import java.util.List;

import cn.edu.zjut.entity.Page;
import cn.edu.zjut.util.PageData;

public interface ChannelMapper {
	
	/* 电视台列表 */
	List<PageData> channellistPage(Page page);
	
	/* 省份下拉列表 */
	List<String> provincelist();
	
	/* 根据省份名称查询电视台列表*/
	List<PageData> findByProvinceName(PageData pd);
	
	/* 删除 */
	void delete(PageData pd);
	
	/* 根据电视台编码查询数据 */
	PageData findById(PageData pd);
	
	/* 保存 */
	void save(PageData pd);
	
	/* 修改*/
	void edit(PageData pd);
	
}
