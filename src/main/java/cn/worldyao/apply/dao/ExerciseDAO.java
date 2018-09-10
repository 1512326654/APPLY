package cn.worldyao.apply.dao;

import cn.worldyao.apply.entity.Catalog;
import cn.worldyao.apply.entity.Exercise;
import cn.worldyao.apply.entity.Type;

import java.util.List;
import java.util.Map;

public interface ExerciseDAO {

	/**
	 * 分类型获取题目
	 * @param map
	 * @return
	 */
	public abstract List<Exercise> getExerciseType(Map<String,Integer> map);

	/**
	 * 分类型获取题目总数
	 * @param map
	 * @return
	 */
	public abstract int getExerciseTypeNum(Map<String,Object> map);

	/**
	 * 获取类型
	 * @return
	 */
	public abstract List<Type> getType();

	/**
	 * 获取分类
	 * @return
	 */
	public abstract List<Catalog> getCata();
}
