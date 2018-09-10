package cn.worldyao.apply.dao;

import cn.worldyao.apply.entity.Admin;

import java.util.Map;

public interface AdminDAO {
	/**
	 * 管理员登录接口
	 * @param map
	 * @return
	 */
	public abstract Admin adminLogin(Map<String,Object> map);
}
