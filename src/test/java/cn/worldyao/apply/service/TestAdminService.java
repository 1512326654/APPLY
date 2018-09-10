package cn.worldyao.apply.service;

import cn.worldyao.apply.entity.Student;
import cn.worldyao.apply.service.AdminService;
import com.alibaba.fastjson.JSON;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class TestAdminService {
	@Resource
	private AdminService adminService;

	@Test
	public void getStudentList(){
//		for (Student student : adminService.getStudentList(0,0,12,2)){
//			System.out.println(student);
//		}
//		System.out.println(adminService.getStudentListNum(0,0));
	}
	@Test
	public void getStudentListNum(){
		System.out.println(adminService.getStudentListNum(1,0));
	}
}
