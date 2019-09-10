package com.wq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wq.dao.EmployeeMapper;
import com.wq.domain.Employee;
import com.wq.domain.EmployeeExample;
import com.wq.domain.EmployeeExample.Criteria;

/**
 * @author WQ
 * @version 创建时间：2019年8月10日 上午8:34:10
 * @ClassName 类名称
 * @Description 类描述
 */

@Service
public class EmployeeService {

	// 获取dao层对象
	@Autowired
	private EmployeeMapper employeeMapper;

	// 获取所有员工对象
	public List<Employee> findAll() {
		return employeeMapper.selectByExampleWithDept(null);
	}

	//根据empId删除员工
	public void delByEmpId(Integer empId) {
		employeeMapper.deleteByPrimaryKey(empId);
	}

	//批量删除员工
	public void delEmpsByIds(List<Integer> list) {
		// TODO Auto-generated method stub
		//获取条件对象
		EmployeeExample example = new EmployeeExample();
		//获取Criteria对象
		Criteria criteria = example.createCriteria();
		//调用Criteria的andEmpIdIn方法，将list参数传入，作为删除员工信息的条件
		criteria.andEmpIdIn(list);
		employeeMapper.deleteByExample(example);
	}
	
	//根据id获取员工
	public Employee findEmpByEmpId(Integer empId) {
		return employeeMapper.selectByPrimaryKey(empId);
	}

	public void updateEmp(Employee employee) {
		// TODO Auto-generated method stub
		employeeMapper.updateByPrimaryKeySelective(employee);
	}

	public void saveEmp(Employee employee) {
		// TODO Auto-generated method stub
		employeeMapper.insertSelective(employee);
	}

	public List<Employee> findEmpByEmpName(String empName) {
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpNameEqualTo(empName);
		// TODO Auto-generated method stub
		return employeeMapper.selectByExample(example);
	}
}
