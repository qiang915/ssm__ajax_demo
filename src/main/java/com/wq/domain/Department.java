package com.wq.domain;

public class Department {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tbl_dept.dept_id
     *
     * @mbg.generated Mon Aug 12 08:11:21 CST 2019
     */
    private Integer deptId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tbl_dept.dept_name
     *
     * @mbg.generated Mon Aug 12 08:11:21 CST 2019
     */
    private String deptName;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tbl_dept.dept_id
     *
     * @return the value of tbl_dept.dept_id
     *
     * @mbg.generated Mon Aug 12 08:11:21 CST 2019
     */
    public Integer getDeptId() {
        return deptId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tbl_dept.dept_id
     *
     * @param deptId the value for tbl_dept.dept_id
     *
     * @mbg.generated Mon Aug 12 08:11:21 CST 2019
     */
    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tbl_dept.dept_name
     *
     * @return the value of tbl_dept.dept_name
     *
     * @mbg.generated Mon Aug 12 08:11:21 CST 2019
     */
    public String getDeptName() {
        return deptName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tbl_dept.dept_name
     *
     * @param deptName the value for tbl_dept.dept_name
     *
     * @mbg.generated Mon Aug 12 08:11:21 CST 2019
     */
    public void setDeptName(String deptName) {
        this.deptName = deptName == null ? null : deptName.trim();
    }
}