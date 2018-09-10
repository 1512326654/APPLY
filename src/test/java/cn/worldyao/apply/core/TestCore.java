package cn.worldyao.apply.core;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class TestCore {

	Core core = new Core();
	@Test
	public void writeReport(){
		core.writeReport(1,null);
	}


}
