package mapperTest;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.edu.zjut.mapper.ShowMapper;
import cn.edu.zjut.util.PageData;

public class ShowMapperTest {
	private ApplicationContext applicationContext;
	
	@Before
	public void setUp() throws Exception {
		applicationContext = new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");
	}

	@Test
	public void testGetProvinceH() throws Exception {
		ShowMapper showMapper = (ShowMapper) applicationContext.getBean("showMapper");
		List<PageData>  provinceH = showMapper.provinceheat();
		System.out.println(provinceH);
	}
	
	
}
