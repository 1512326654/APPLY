package cn.worldyao.apply.service.impl;

import cn.worldyao.apply.util.CommonUtil;
import com.alibaba.fastjson.JSON;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class TestCoreServiceImpl {

	@Resource
	private CoreServiceImpl coreService;

	@Test
	public void writeToExcel(){
		coreService.writeToExcel(1,21);
	}

	@Test
	public void getLeaderSheetNum(){
		Map map = coreService.getLeaderSheetNum();
		System.out.println(JSON.toJSONString(map));
	}
}
