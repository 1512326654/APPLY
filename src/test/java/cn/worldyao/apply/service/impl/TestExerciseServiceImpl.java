package cn.worldyao.apply.service.impl;

import cn.worldyao.apply.entity.Exercise;
import com.alibaba.fastjson.JSON;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class TestExerciseServiceImpl {

	@Resource
	private ExerciseServiceImpl exerciseService;

	@Test
	public void getExerciseType(){
		for (Exercise exercise : exerciseService.getExerciseType(1,1,1,15)){
			System.out.println(exercise);
		}
	}

	@Test
	public void getExerciseTypeNum(){
		System.out.println(exerciseService.getExerciseTypeNum(1,5));
	}

	@Test
	public void getType(){
		System.out.println(JSON.toJSONString(exerciseService.getType()));
	}
}
