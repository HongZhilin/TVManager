package serviceTest;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.edu.zjut.entity.Program;
import cn.edu.zjut.service.ProgramService;

public class ProgramServiceTest {
	private ApplicationContext applicationContext;
	@Before
	public void setUp() throws Exception {
		applicationContext = new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");
	}

/*	@Test
	public void testSelectProgramlist() throws Exception {
		ProgramService programService= (ProgramService) applicationContext.getBean("programService");
	    Program program=new Program();
		program.setProvince("其他");
		program.setChannelName("留学世界");
		program.setProgram("招考热线");
		List<Program>  programList =  programService.selectProgramlist(program);
		System.out.println(programList);
	}*/

}
