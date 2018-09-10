package cn.worldyao.apply.service.impl;

import cn.worldyao.apply.entity.MemberReportStatus;
import cn.worldyao.apply.service.impl.ReportServiceImpl;
import cn.worldyao.apply.service.impl.StudentServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class TestStudentServiceImpl {
	@Resource
	private StudentServiceImpl studentService;

//	@Test
//	public void showMemberReportStatus(){
//		for (MemberReportStatus memberReportStatus : studentService.showMemberReportStatus(1,9,18)){
//			System.out.println(memberReportStatus);
//		}
//	}

	@Test
	public void showReportByREPID(){
		System.out.println(studentService.showReportByREPID(80));
	}
}
