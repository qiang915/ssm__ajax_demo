package com.wq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wq.dao.DepartmentMapper;
import com.wq.domain.Department;

/**
* @author WQ
* @version 创建时间：2019年8月11日 下午2:43:42
* @ClassName 类名称
* @Description 类描述
*/

@Service
public class DepartmentService {
	
	//dao层对象
	@Autowired
	private DepartmentMapper departmentMapper;

	/**
	 * 	获取所有dept信息
	 * @return 
	 * */
	public List<Department> findAll() {
		// TODO Auto-generated method stub
		return departmentMapper.selectByExample(null);
	}
	
}
