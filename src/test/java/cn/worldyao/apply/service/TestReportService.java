package cn.worldyao.apply.service;

import cn.worldyao.apply.entity.Report;
import cn.worldyao.apply.entity.ReportBase;
import cn.worldyao.apply.service.ReportService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class TestReportService {
	@Autowired
	private ReportService reportService;
	@Test
	public void showReportList() {
		System.out.println(reportService.showReportList(0,0,18,1,15));
	}

	@Test
	public void selReportByThisWeek(){
		for (Report report : reportService.selReportByThisWeek(1,18)){
			System.out.println(report);
		}
	}
}
