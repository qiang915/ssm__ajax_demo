package com.wq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wq.dao.UserMapper;
import com.wq.domain.User;
import com.wq.domain.UserExample;
import com.wq.domain.UserExample.Criteria;

/**
* @author WQ
* @version 创建时间：2019年8月12日 上午8:45:45
* @ClassName 类名称
* @Description 类描述
*/

@Service
public class UserService {

	//获取dao层对象
	@Autowired
	private UserMapper userMapper;

	//根据用户名查询用户信息
	public List<User> findByUsername(String username) {
		// TODO Auto-generated method stub
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(username);
		List<User> lists = userMapper.selectByExample(example);
		return lists;
	}
	

	
}
