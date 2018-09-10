package cn.worldyao.apply.dao;

import cn.worldyao.apply.util.CommonUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class TestCommonUtil {
	@Test
	public void getDirList(){
		CommonUtil.getDirList();
	}

	@Test
	public void isSubmit(){
		String s = CommonUtil.isSubmit(1,9);
		System.out.println( s == null);
	}
}
