package serviceTest;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.edu.zjut.service.ChannelService;
import cn.edu.zjut.util.PageData;

public class ChannelServiceTest {
	
	private ApplicationContext applicationContext;
	@Before
	public void setUp() throws Exception {
		applicationContext = new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");
	}

	@Test
	public void testListProvinceName() throws Exception {
		ChannelService channelMapper = (ChannelService) applicationContext.getBean("channelService");
		List<String>  provinceList =  channelMapper.provincelist();
		System.out.println(provinceList);
	}
	
	@Test
	public void testfindByProvinceName() throws Exception {
		ChannelService channelMapper = (ChannelService) applicationContext.getBean("channelService");
		PageData pd = new PageData();
		List<PageData>  provinceList =  channelMapper.findByProvinceName(pd);
		System.out.println(provinceList);
	}

}
