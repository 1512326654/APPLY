package cn.worldyao.apply.service;

import cn.worldyao.apply.entity.StudentUser;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class TestUserService {

	@Resource
	private UserService userService;

	@Test
	public void checkUsername(){
		System.out.println(userService.checkUsername("董尧"));
	}

	@Test
	public void showStudentInfo(){
		System.out.println(userService.showStudentInfo(1,9));
	}

	@Test
	public void showAssociationStauts(){
		List<StudentUser> list = userService.showAssociationStauts();
		for (StudentUser studentUser : list){
			System.out.println(studentUser);
		}
	}
}
