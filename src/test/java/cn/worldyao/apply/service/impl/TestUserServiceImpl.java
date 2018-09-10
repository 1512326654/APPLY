package cn.worldyao.apply.service.impl;

import cn.worldyao.apply.entity.StudentUser;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class TestUserServiceImpl {

	@Resource
	private UserServiceImpl userService;

	@Test
	public void checkUsername(){
		System.out.println(userService.checkUsername("董尧"));
	}

	@Test
	public void showStudentInfo(){
		for (StudentUser studentUser : userService.showStudentInfo(1,9)){
			System.out.println(studentUser);
		}
	}
}
