package cn.worldyao.apply.dao;

import cn.worldyao.apply.entity.Student;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class IStudentTest {

	@Autowired
	private StudentDAO iStudentDAO;
//	@Test
/*	public void testSelectUser() throws Exception{
		int sheetNum = 1;
		Student student = iStudentDAO.selectUser(sheetNum);
			System.out.println(student);
	}*/
}
