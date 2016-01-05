package mapperTest;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.edu.zjut.mapper.OriginMapper;
import cn.edu.zjut.util.PageData;

public class OriginMapperTest {
	private ApplicationContext applicationContext;
	
	@Before
	public void setUp() throws Exception {
		applicationContext = new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");
	}

	@Test
	public void testGetTopN() throws Exception {
		OriginMapper originMapper = (OriginMapper) applicationContext.getBean("originMapper");
		List<PageData>  topN = originMapper.getTopN();
		System.out.println(topN);
	}
	
	
}
