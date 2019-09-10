package com.wq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wq.domain.Msg;
import com.wq.domain.User;
import com.wq.service.UserService;

/**
* @author WQ
* @version 创建时间：2019年8月12日 上午8:44:55
* @ClassName 类名称
* @Description 类描述
*/

@RequestMapping("/user")
@Controller
public class UserController {

	//获取service层对象
	@Autowired
	private UserService userService;
	
	/**
	 * 	界面跳转
	 * */
	@RequestMapping("/toList")
	public String toList() {
		return "list";
	}
	
	/**
	 * 	监测用户名是否存在
	 * */
	@ResponseBody
	@RequestMapping(value="/findByUsername.do/{username}",method=RequestMethod.GET)
	public Msg findByUsername(@PathVariable("username")String username) {
		//调用service层对象
		List<User> users = userService.findByUsername(username);
		//list的长度为1，则表示存在此用户，返回处理成功信息
		if(users.size() == 1) {
			User user = users.get(0);
			return Msg.success().add("user", user);
		}
		//list的长度为0，则表示不存在此用户，返回处理失败信息
		if(users.size() == 0) {
			return Msg.failtrue();
		}
		return null;
	}
	
}
