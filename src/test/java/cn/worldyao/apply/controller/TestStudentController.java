package cn.worldyao.apply.controller;

import com.alibaba.fastjson.JSON;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import javax.annotation.Resource;

import java.util.Map;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-mybatis.xml","classpath:spring-mvc.xml"})
@WebAppConfiguration
public class TestStudentController {
	@Autowired
	private WebApplicationContext webApplicationContext;

	private MockMvc mockMvc;



	//方法执行前初始化数据
	@Before
	public void setUp() throws Exception {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(this.webApplicationContext ).build();
	}


	@Test
	public void isSubmit() throws Exception{
		String mvcResult = this.mockMvc.perform(get("/student/isSubmit.do")
				.param("classNum","9").param("groupNum","8"))
				.andExpect(status().isOk())    //返回的状态是200
				.andDo(print())         //打印出请求和相应的内容
				.andReturn().getResponse().getContentAsString();
		System.out.println(mvcResult);
	}

	@Test
	public void isSubmit2(){
//		StudentController studentController = new StudentController();
//		System.out.println(studentController.isSubmit(1,8));
		AdminController controller = new AdminController();
		System.out.println(controller.writeToExcel(1));
	}

	@Test
	public void getLeaderSheetNum(){
		AdminController adminController = new AdminController();

	}
}
