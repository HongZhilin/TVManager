package cn.edu.zjut.mapper;

import java.util.List;

import cn.edu.zjut.entity.Page;
import cn.edu.zjut.util.PageData;

public interface ProgramMapper {
	
	List<PageData> programlistPage(Page page);
	
	PageData findProgramById(PageData pd);
	
	/* 保存 */
	void saveProgram(PageData pd);
	
	/* 修改*/
	void editProgram(PageData pd);
	
	/* 删除 */
	void deleteProgramById(PageData pd);
	
	/* 批量删除 */
	void deletePrograms(Integer[] id);
	
	void importFromExcel(List<PageData> list);
}
