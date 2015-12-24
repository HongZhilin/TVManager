package cn.edu.zjut.service;

import java.util.List;

import cn.edu.zjut.entity.Page;
import cn.edu.zjut.util.PageData;

public interface ProgramService {
	
	List<PageData> list(Page page);
	
	PageData findProgramById(PageData pd);
	
	/* 保存 */
	void saveProgram(PageData pd);
	
	/* 修改*/
	void editProgram(PageData pd);
	
	/* 删除 */
	void deleteProgramById(PageData pd);

	void deletePrograms(Integer[] id);
}
