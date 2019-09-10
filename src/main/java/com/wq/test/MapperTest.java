package com.wq.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wq.dao.DepartmentMapper;
import com.wq.dao.EmployeeMapper;

/**
 * 使用spring的项目测试时建议使用Spring-test进行测试 使用步骤： 1、导入Spring-test依赖
 * 2、使用@ContextConfiguration注解指定配置问价 位置 3、直接使用autowired注解组件即可
 * 
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class MapperTest {

	@Autowired
	DepartmentMapper departmentMapper;

	@Autowired
	EmployeeMapper employeeMapper;

	//批量操作的bean对象
	/*
	 * @Autowired SqlSession sqlSession;
	 */
	@Test
	public void testCRUD() {
		System.out.println(departmentMapper);

		// 插入部门信息
//		departmentMapper.insertSelective(new Department(null,"开发部"));
//		departmentMapper.insertSelective(new Department(null,"测试部"));
//		departmentMapper.insertSelective(new Department(null, "测试2部"));
//		departmentMapper.deleteByPrimaryKey(3);

		// 插入员工信息
//		employeeMapper.insertSelective(new Employee(null,"Jerry","M","Jerry@qq.com",1));

		// 批量插入员工信息，可以使用批量操作的SqlSession

//		EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
//		for (int i = 0; i < 100; i++) {
//			String uid = UUID.randomUUID().toString().substring(0, 5) + i;
//			mapper.insertSelective(new Employee(null, uid, "M", uid + "qq.com", 1));
//		}
//		employeeMapper.deleteByPrimaryKey(101);

	}
}
