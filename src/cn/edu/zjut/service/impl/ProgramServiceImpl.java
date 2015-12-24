package cn.edu.zjut.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.edu.zjut.entity.Page;
import cn.edu.zjut.mapper.ProgramMapper;
import cn.edu.zjut.service.ProgramService;
import cn.edu.zjut.util.PageData;

public class ProgramServiceImpl implements ProgramService{
	
	@Autowired
	private ProgramMapper programMapper;
	
	public List<PageData> list(Page page) {
		return programMapper.programlistPage(page);
	}

	public void saveProgram(PageData pd) {
		programMapper.saveProgram(pd);
		
	}

	public void editProgram(PageData pd) {
		programMapper.editProgram(pd);
		
	}

	public void deleteProgramById(PageData pd) {
		programMapper.deleteProgramById(pd);
		
	}

	public PageData findProgramById(PageData pd) {
		return programMapper.findProgramById(pd);
	}

	public void deletePrograms(Integer[] id) {
		programMapper.deletePrograms(id);
		
	}

}
