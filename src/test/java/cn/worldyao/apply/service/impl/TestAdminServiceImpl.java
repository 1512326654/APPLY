package cn.worldyao.apply.service.impl;

import cn.worldyao.apply.service.AdminService;
import cn.worldyao.apply.service.impl.AdminServiceImpl;
import cn.worldyao.apply.service.impl.StudentServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class TestAdminServiceImpl {
	@Resource
	private AdminService adminService;


//	@Test
//	public void eachClassGroupReportedNum(){
//		System.out.println(adminService.eachClassGroupReportedNum(1,18));
//	}

	@Test
	public void showReportList(){
		System.out.println(adminService.showReportList(0,0,18,1,15));
	}
}
