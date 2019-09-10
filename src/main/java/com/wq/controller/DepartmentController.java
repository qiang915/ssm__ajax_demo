package com.wq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wq.domain.Department;
import com.wq.domain.Msg;
import com.wq.service.DepartmentService;

/**
* @author WQ
* @version 创建时间：2019年8月11日 下午2:42:33
* @ClassName 类名称
* @Description 类描述
*/

@Controller
@RequestMapping("/department")
public class DepartmentController {

	//service层的对象
	@Autowired
	private DepartmentService departmentService;
	
	/**
	 * 	获取所有部门信息
	 * */
	@ResponseBody
	@RequestMapping("/findAll.do")
	public Msg findAll() {
		List<Department> departments = departmentService.findAll();
		return Msg.success().add("departments", departments);
	}
	
}
