package cn.worldyao.apply.service;

import cn.worldyao.apply.entity.MemberReportStatus;
import cn.worldyao.apply.entity.ReportBase;
import cn.worldyao.apply.entity.ReportInfo;
import cn.worldyao.apply.service.StudentService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class TestStudentService {
	@Resource
	private StudentService studentService;

/*	@Test
	public void showMemberReportStatus(){
		for (MemberReportStatus memberReportStatus : studentService.showMemberReportStatus(1,9,18)){
			System.out.println(memberReportStatus);
		}
	}*/

	@Test
	public void showReportList(){
		for (ReportInfo memberReportStatus : studentService.showReportList(2,0,18)){
			System.out.println(memberReportStatus);
		}
	}

	/**
	 * 时间轴测试
	 */
	@Test
	public void timeLine(){
		for (ReportBase memberReportStatus : studentService.timeLine(1,59)){
			System.out.println(memberReportStatus);
		}
	}
}
