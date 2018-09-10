package cn.worldyao.apply.dao;

import cn.worldyao.apply.entity.Exercise;
import com.alibaba.fastjson.JSON;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class TestExerciseDAO {
	@Resource
	private ExerciseDAO exerciseDAO;

	@Test
	public void getExercise(){
//		List<Exercise> list = exerciseDAO.getExercise();
///*		for (Exercise exercise : list ){
//			System.out.println(exercise);
//		}*/
//		System.out.println(JSON.toJSONString(list));
	}
}
