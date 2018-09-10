package cn.worldyao.apply.service.impl;

import cn.worldyao.apply.entity.GroupNum;
import cn.worldyao.apply.entity.MemberReportStatus;
import cn.worldyao.apply.service.ReportService;
import cn.worldyao.apply.service.impl.ReportServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class TestReportServiceImpl {

	@Resource
	private ReportServiceImpl reportServiceImpl;

	private ReportService reportService;

//	@Test
//	public void showGroupReportStatus(){
//		reportService.showGroupReportStatus(1,9,17);
//	}

//	@Test
//	public void showGroupReportStatus(){
//		reportService.showReportList(1,0,18);
//	}
@Test
	public void eachClassGroupReportedNum(){
		for (GroupNum groupNum : reportService.eachClassGroupReportedNum(2,20)) {
			System.out.println(groupNum);
		}
	}
}
