package cn.worldyao.apply.dao;

import cn.worldyao.apply.entity.Suggest;

/**
 *
 * @author 董尧
 */
public interface SuggestDAO {

	/**
	 * 提交意见
	 * @param suggest
	 * @return
	 */
	public abstract int addSuggest(Suggest suggest);
}
