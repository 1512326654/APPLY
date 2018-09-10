package cn.worldyao.apply.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class TestUserDAO {

	@Resource
	private UserDAO userDAO;

	@Test
	public void checkUsername(){
		System.out.println( (userDAO.checkUsername("董尧")) == null);
	}

	@Test
	public void studentConnection(){
		Map<String,Integer> map = new HashMap<String, Integer>(1);
		map.put("stuId", 98);
		System.out.println(userDAO.studentConnection(map));
	}

	@Test
	public void showStudentInfo(){
		Map<String,Integer> map = new HashMap<String, Integer>(1);
		map.put("stuClass", 1);
		map.put("stuGroup", 9);
		System.out.println(userDAO.showStudentInfo(map));
	}
}
