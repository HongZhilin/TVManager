package mapperTest;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.edu.zjut.entity.Program;
import cn.edu.zjut.mapper.ChannelMapper;
import cn.edu.zjut.mapper.ProgramMapper;

public class ProgramMapperTest {
	private ApplicationContext applicationContext;
	@Before
	public void setUp() throws Exception {
		applicationContext = new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");
	}

	/*@Test
	public void testSelectProgramlist2() throws Exception {
		ProgramMapper programMapper= (ProgramMapper) applicationContext.getBean("programMapper");
//		Program program=new Program();
//		program.setProvince("其他");
//		program.setChannelName("留学世界");
//		program.setProgram("招考热线");
//		List<Program>  programList =  programMapper.selectProgramlist2(program);
		List<Program>  programList =  programMapper.selectProgramlist2("其他","留学世界","招考热线");
		System.out.println(programList);
	}*/
	@Test
	public void testSelectProgramlist() throws Exception {
		ChannelMapper channelMappe=(ChannelMapper) applicationContext.getBean("channelMapper");
		
		System.out.println(channelMappe.provincelist());
	}

}
