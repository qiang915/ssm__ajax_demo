package com.wq.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wq.domain.Employee;
import com.wq.domain.Msg;
import com.wq.service.EmployeeService;

/**
 * @author WQ
 * @version 创建时间：2019年8月10日 上午9:37:09
 * @ClassName 类名称
 * @Description 类描述
 */

@Controller
@RequestMapping("/employee")
public class EmployeeController {

	// 得到service对象
	@Autowired
	private EmployeeService employeeService;
	
	
	/**
	 * 	根据员工姓名查询员工信息
	 * */
	@ResponseBody
	@RequestMapping("/findByEmpName.do/{empName}")
	public Msg findByEmpName(@PathVariable("empName")String empName) {
		//调用service层方法
		List<Employee> employees = employeeService.findEmpByEmpName(empName);
		//得到employees的长度
		int num = employees.size();
		if(num == 0) {
			return Msg.success();
		}else {
			return Msg.failtrue();
		}
	}
	
	/**
	 * 	保存员工信息
	 * */
	@ResponseBody
	@RequestMapping("/saveEmp.do")
	public Msg saveEmp(Employee employee) {
		//调用service层方法完成数据保存操作
		employeeService.saveEmp(employee);
		return Msg.success();
	}
	
	/**
	 * 	更新emp数据
	 * */
	@ResponseBody
	@RequestMapping(value="/updateEmp.do/{empId}",method=RequestMethod.PUT)
	public Msg updateEmp(Employee employee) {
		//调用service层方法完成更新操作
		employeeService.updateEmp(employee);
		return Msg.success();
	}
	
	/**
	 * 	根据id查询员工信息
	 * */
	@ResponseBody
	@RequestMapping("/findEmpByEmpId.do/{empId}")
	public Msg findEmpByEmpId(@PathVariable("empId")Integer empId) {
		Employee employee = employeeService.findEmpByEmpId(empId);
		return Msg.success().add("employee", employee);
	}
	
	/**
	 * 批量删除员工
	 * */
	@ResponseBody
	@RequestMapping(value="/delEmpsByIds.do/{subEmpIds}",method=RequestMethod.DELETE)
	public Msg delEmpsByIds(@PathVariable("subEmpIds")String empIds) {
		//以逗号为分隔符分隔empIds，转换成以数组形式的字符串
		String[] empIdsStr = empIds.split(",");
		//定义一个数组，长度为empIdsStr的长度，用于接收字符串型数组转为整型数组的结果
		Integer[] empIdsInt = new Integer[empIdsStr.length];
		//遍历字符串型数组，为整型数组赋值，完成转换
		for (int i=0;i<empIdsStr.length;i++) {
			empIdsInt[i] = Integer.parseInt(empIdsStr[i]);
		}
		//将数组转换为list，将数组转换为list形式 
		List<Integer> list = Arrays.asList(empIdsInt);
		//调用service层方法
		employeeService.delEmpsByIds(list);
		return Msg.success();
	}

	/**
	 * 根据empId删除员工
	 */
	@ResponseBody
	@RequestMapping(value = "/delByEmpId.do/{empId}", method = RequestMethod.DELETE)
	public Msg delByEmpId(@PathVariable("empId") Integer empId) {
		// 拿到前段传来的empId数据，调用service层方法完成删除操作
		employeeService.delByEmpId(empId);
		return Msg.success();
	}

	/**
	 * 得到所有员工信息，在jsp页面要分页显示，这里使用分页插件pageHelper
	 */
	@ResponseBody
	@RequestMapping("/findAll.do")
	public Msg findAll(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
		// System.out.println(pageNum);
		// 使用此方法传入的两个参数，分别为当前页码、每页显示数据条数
		PageHelper.startPage(pageNum, 8);
		// 调用service层拿到员工数据
		List<Employee> employees = employeeService.findAll();
		// 将数据库查询出来的数据封装到pageInfo中，两个参数，第一个参数是pageInfo对象的list属性，第二个属性是分页条每次显示的页数
		PageInfo<Employee> pageInfo = new PageInfo<Employee>(employees, 5);
		return Msg.success().add("pageInfo", pageInfo);
	}

}
