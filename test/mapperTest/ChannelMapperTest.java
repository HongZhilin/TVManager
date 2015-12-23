package mapperTest;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.edu.zjut.mapper.ChannelMapper;
import cn.edu.zjut.util.PageData;

public class ChannelMapperTest {
	private ApplicationContext applicationContext;
	
	@Before
	public void setUp() throws Exception {
		applicationContext = new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");
	}

	@Test
	public void testListProvinceName() throws Exception {
		ChannelMapper channelMapper = (ChannelMapper) applicationContext.getBean("channelMapper");
		List<String>  channelList =  channelMapper.provincelist();
		System.out.println(channelList);
	}
	
	@Test
	public void testListChannelNameByProvinceName() throws Exception {
		ChannelMapper channelMapper = (ChannelMapper) applicationContext.getBean("channelMapper");
		PageData pd = new PageData();
		List<PageData> channelName= channelMapper.findByProvinceName(pd);
		System.out.println(channelName);
	}

}
