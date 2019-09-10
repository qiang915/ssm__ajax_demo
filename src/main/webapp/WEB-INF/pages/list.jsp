<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<!-- 将虚拟路径放入request域中，备用 -->
<%
	request.setAttribute("path", path);
%>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!-- 导入bootstrap所需依赖 -->
<link rel="stylesheet"
	href="${path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<script src="${path}/static/jQuery/jquery-1.12.4.js"></script>
<script src="${path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>

<body>

	<!-- 新增员工模态框 -->
	<!-- Modal -->
	<div class="modal fade" id="add_emp_modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新增员工界面</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="add_emp_form">
						<div class="form-group">
							<label class="col-sm-2 control-label">empName</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" placeholder="empName"
									name="empName" id="add_emp_empName"><span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">email</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" placeholder="email"
									name="email" id="add_emp_modal_email"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">gender</label> <label
								class="radio-inline"> <input type="radio" name="gender"
								value="M"> 男
							</label> <label class="radio-inline"> <input type="radio"
								name="gender" value="F"> 女
							</label>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">deptName</label>
							<div class="col-sm-10">
								<select class="form-control" id="add_deptName" name="dId">
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="save_emp_btn">Save
						changes</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 编辑员工模态框 -->
	<!-- Modal -->
	<div class="modal fade" id="edit_emp_modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">员工编辑界面</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_emp_form">
						<div class="form-group">
							<label class="col-sm-2 control-label">empId</label>
							<div class="col-sm-10">
								<input type="text" name="empId" class="form-control"
									id="edit_emp_modal_empId" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">empName</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="empName"
									id="edit_emp_modal_empName" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">email</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="email"
									id="edit_emp_modal_email"> <span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">gender</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="gender" value="M" checked="checked"> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" value="F"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">deptName</label>
							<div class="col-sm-4">
								<!-- 部门提交部门id即可 -->
								<select class="form-control" name="dId" id="edit_deptName">
								</select>
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="update_emp_btn">Save
						changes</button>
				</div>
			</div>
		</div>
	</div>


	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<h1>SSM_AJAX_CRUD</h1>
			</div>
		</div>

		<div class="row">
			<div class="col-xs-8"></div>
			<div class="col-xs-4">
				<button type="button" class="btn btn-primary btn-lg"
					id="add_emp_btn">
					<span class="glyphicon glyphicon-plus"></span> 新增
				</button>
				<button type="button" class="btn btn-danger btn-lg" id="del_all_btn">
					<span class="glyphicon glyphicon-remove"></span> 删除
				</button>
			</div>
		</div>

		<div class="row" style="margin-top: 5px">
			<div class="col-xs-12">
				<div class="panel panel-warning">
					<!-- Default panel contents -->
					<div class="panel-heading">员工信息列表</div>

					<!-- Table -->
					<table class="table table-hover" id="emp_table"
						style=" text-align:center; ">
						<thead>
							<tr>
								<td><input type="checkbox" class="check_all"></td>
								<td>#</td>
								<td>姓名</td>
								<td>性别</td>
								<td>邮箱</td>
								<td>部门</td>
								<td>操作</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>0</td>
								<td>wq</td>
								<td>男</td>
								<td>wq@139.com</td>
								<td>CRUD</td>
							</tr>
						</tbody>
					</table>

					<div class="panel-footer">开发者：卫强</div>
				</div>
			</div>
		</div>

		<div class="row">
			<!-- 分页信息展示 -->
			<div class="col-xs-6" id="show_page_info"></div>
			<!-- 分页条展示 -->
			<div class="col-xs-6" id="page_shape"></div>
		</div>
	</div>

	<script type="text/javascript">
	
		//全局变量：当前页，总页数
		var currentPage;
		var totalPages;
	
		/* 当页面加载完成后，执行的函数 */
		$(function() {
			//调用跳转页面函数，默认跳转到首页
			to_page(1);
		})
	
		//跳转到哪页，跳转到的页面需要提供当前页面需要展示的数据，以及分页信息、分页条
		function to_page(pageNum) {
			//alert(1);
			$.ajax({
				url : "${path}/employee/findAll.do",
				type : "GET",
				data : "pageNum=" + pageNum,
				success : function(result) {
					//分页条的展示
					show_page_shape(result);
					//分页信息的展示
					show_page_info(result);
					//数据列表的展示
					show_emp_table(result);
				}
			})
		}
	
		//分页条的展示
		function show_page_shape(result) {
			//在展示分页条之前先清除原来存在的分页条
			$("#page_shape").empty();
			//分页最高辈分标签<nav aria-label="Page navigation"></nav>
			var nav = $("<nav aria-label='Page navigation'></nav>");
			//分页次高辈分标签<ul class="pagination"></ul>
			var ul = $("<ul class='pagination'></ul>");
			//分页最低辈分标签<li></li>
			//var li = $("<li></li>");
			//首页
			var firstPage = $("<li></li>").append("<a aria-label='Previous'><span aria-hidden='true'>首页</span></a>");
			//上一页
			var prePage = $("<li></li>").append("<a aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a>");
			//向ul中添加首页及上一页
			ul.append(firstPage).append(prePage);
			//判断当前页面是否是第一页，若是则将首页与上一页设置为不可点击状态，若不是则为首页及上一页添加单击事件
			if (result.map.pageInfo.pageNum == 1) {
				firstPage.addClass("disabled");
				prePage.addClass("disabled");
			} else {
				//为首页添加单击事件
				firstPage.click(function() {
					//点击首页直接跳转到第一页
					to_page(1);
				});
				//为上一页添加单击事件
				prePage.click(function() {
					//点击上一页，跳转到上一页，即跳转到当前页-1
					to_page(result.map.pageInfo.pageNum - 1);
				});
			}
			//返回的分页显示的条数：result.map.pageInfo.navigatePages，此数作循环输出分页数
			$.each(result.map.pageInfo.navigatepageNums, function(index, item) {
				//1、2、3、4、5
				var numLi = $("<li></li>").append($("<a></a>").append(item));
				//将生成的页数添加到ul中
				ul.append(numLi);
				//判断当前页面是否是item，若是则添加属性使其为激活状态，若不是则添加单击事件
				if (result.map.pageInfo.pageNum == item) {
					numLi.addClass("active");
				} else {
					//为numLi添加单击事件
					numLi.click(function() {
						to_page(item);
					});
				}
			})
			//下一页
			var nextPage = $("<li></li>").append("<a aria-label='Previous'><span aria-hidden='true'>&raquo;</span></a>");
			//尾页
			var lastPage = $("<li></li>").append("<a aria-label='Previous'><span aria-hidden='true'>尾页</span></a>");
			//向ul中添加下一页及尾页
			ul.append(nextPage).append(lastPage);
			//判断当前页是否是最后一页，若是则将尾页与下一页设置为不可点击状态，若不是则为尾页与下一页添加不可点击事件
			if (result.map.pageInfo.pageNum == result.map.pageInfo.pages) {
				nextPage.addClass("disabled");
				lastPage.addClass("disabled");
			} else {
				//为下一页添加单击事件
				nextPage.click(function() {
					//点击下一页，跳转到下一页，即跳转到当前页+1
					to_page(result.map.pageInfo.pageNum + 1);
				});
				//为尾页添加单击事件
				lastPage.click(function() {
					//点击尾页，直接跳转到最后一页
					to_page(result.map.pageInfo.pages);
				});
			}
			//向nav中添加ul
			nav.append(ul);
			//将nav添加到指定区域
			nav.appendTo("#page_shape");
		}
	
		//分页信息的展示
		function show_page_info(result) {
			//在展示分页信息之前先清除原来的分页信息
			$("#show_page_info").empty();
			//展示分页信息，当前？页，共有？页，共有？条数据
			var info = $("<span style='font-size: 25px;'>当前第" + result.map.pageInfo.pageNum + "页，共有" + result.map.pageInfo.pages + "页，共有" + result.map.pageInfo.total + "条数据。</span>");
			//将info放入相应位置
			info.appendTo("#show_page_info");
			//为全局变量当前页赋值
			currentPage = result.map.pageInfo.pageNum;
			//为全局变量totalPages赋值
			totalPages = result.map.pageInfo.pages;
		}
	
		//数据列表的展示
		function show_emp_table(result) {
			//在展示数据列表之前先清除原来的数据列表
			$("#emp_table tbody").empty();
			//循环遍历输出list中的数据
			var empList = result.map.pageInfo.list;
			$.each(empList, function() {
				//tr
				var tr = $("<tr></tr>");
				//checkbox列
				var checkbox = tr.append("<td><input type='checkbox' class='check_item'/></td>");
				//empId列
				var empIdTr = tr.append("<td>" + this.empId + "</td>");
				//empName列
				var empNameTr = tr.append("<td>" + this.empName + "</td>");
				//gender列
				var genderTr = tr.append("<td>" + this.gender + "</td>");
				//email列
				var emailTr = tr.append("<td>" + this.email + "</td>");
				//dpetName列
				var deptNameTr = tr.append("<td>" + this.department.deptName + "</td>");
				//操作按钮列，包括编辑按钮以及删除按钮
				var btnTr = tr.append("<td>" + "<button class='btn btn-info  edit_emp_btn'  emp_id='" + this.empId + "' emp_name='" + this.empName + "'><span class='glyphicon glyphicon-pencil'></span>编辑</button>" + " " + "<button class='btn btn-danger del_emp_btn' emp_id='" + this.empId + "' emp_name='" + this.empName + "'><span class='glyphicon glyphicon-remove'></span>删除</button>" + "</td>");
				//将上述行添加到emp_table的<tbody>中
				$("#emp_table tbody").append(checkbox).append(empIdTr).append(empNameTr).append(genderTr).append(emailTr).append(btnTr);
			})
		}
	
		//全选、全不选效果，给".check_all"添加单击事件
		$(".check_all").click(function() {
			//".check_item"的checked属性的值等于".check_all"的checked属性
			$(".check_item").prop("checked", $(this).prop("checked"));
		});
	
		//给每行复选框添加单击事件，效果：单行复选框有一个没有选中的状态下，全选框也不选中；单行复选框全选中时，全选框也选中
		$(document).on("click", ".check_item", function() {
			//判断单行选中的个数是否等于当行复选框的个数，若相等则表示全选中，则全选框也选中
			var flag = $(".check_item").length == $(".check_item:checked").length;
			$(".check_all").prop("checked", flag);
		});
	
		//给单行删除按钮添加单击事件，点击后向后台发送ajax请求，删除所在行，此处给删除按钮添加class：del_emp_btn
		$(document).on("click", ".del_emp_btn", function() {
			//要删除所在行，则先拿到其对应的empId，事先在删除按钮上添加自定义属性emp_id，其值为empId
			var empId = $(this).attr("emp_id");
			//拿到删除按钮所对应的empName，用于显示提示信息时使用
			var empName = $(this).attr("emp_name");
			//confirm方法作确认删除操作
			if (confirm("确认删除" + empName + "员工吗？")) {
				//alert(111);
				//若确认删除则发送ajax请求到后台，完成根据empId删除
				$.ajax({
					url : "${path}/employee/delByEmpId.do/" + empId,
					type : "DELETE",
					success : function(result) {
						//拿到返回的数据，以alert的形式提示用户操作是否成功
						alert(result.msg);
						//删除成功后，跳转到当前页面
						to_page(currentPage);
					}
				});
			}
		});
	
		//给批量删除按钮添加单击事件
		$("#del_all_btn").click(function() {
			//要删除选中，先得拿到empId
			var empIds = "";
			var empNames = "";
			//循环遍历选中的复选框，将每个选中的复选框对应的empId赋值给empIds
			$.each($(".check_item:checked"), function(index, item) {
				//给empIds赋值，以逗号隔开
				empIds += $(item).parents("tr").find("td:eq(1)").text() + ",";
				//给empNames赋值，以逗号隔开
				empNames += $(item).parents("tr").find("td:eq(2)").text() + ",";
			});
			//截取empIds，去掉最后一个逗号
			subEmpIds = empIds.substring(0, empIds.length - 1);
			//截取empNames，去掉最后一个逗号
			subEmpNames = empNames.substring(0, empNames.length - 1);
			//使用confirm方法作确认删除判断
			if (confirm("确认删除" + subEmpNames + "员工吗？")) {
				//向服务器端发送ajax请求，根据empIds删除指定员工
				$.ajax({
					url : "${path}/employee/delEmpsByIds.do/" + subEmpIds,
					type : "DELETE",
					success : function(result) {
						//操作成功提示信息
						alert(result.msg);
						//跳转到当前页面
						to_page(currentPage);
					}
				});
			}
	
		});
	
		//获取部门信息的函数，参数：将信息放入element对象
		function find_all_dept(element) {
			//在调用前先清空element中存在的部门信息，不清除就会重复插入
			$(element).empty();
			//发送ajax请求，查询数据库中的部门信息
			$.ajax({
				url : "${path}/department/findAll.do",
				type : "GET",
				success : function(result) {
					//option标签所放的位置
					var select = $(element);
					//由于返回的部门信息不是一个，所以要使用each函数遍历
					$.each(result.map.departments, function() {
						//将返回的数据添加到指定位置，此处的element：edit_deptName
						var option = $("<option>" + this.deptName + "</option>").attr("value", this.deptId);
						//将option添加到select中
						option.appendTo(select);
					});
				}
			});
		}
	
		//发送ajax请求，根据empId获取员工信息，并显示在指定位置
		function find_emp_by_empId(empId) {
			//发送ajax请求，从服务器获取员工信息，提供empId
			$.ajax({
				url : "${path}/employee/findEmpByEmpId.do/" + empId,
				type : "GET",
				success : function(result) {
					//将从服务器拿到的数据放到指定位置
					//将empId放入edit_emp_modal_empId内，即给edit_emp_modal_empId的输入框添加属性value，值为result.map.employee.empId
					$("#edit_emp_modal_empId").attr("value", empId);
					//将empName放入edit_emp_modal_empName内，即给edit_emp_modal_empName的输入框添加属性value，值为result.map.employee.empId
					$("#edit_emp_modal_empName").attr("value", result.map.employee.empName);
					//将email放入指定位置，同理
					$("#edit_emp_modal_email").attr("value", result.map.employee.email);
					//将gender的选择框的选中内容设置成数据库中查来的数据，element为模态框中名为gender的输入框
					$("#edit_emp_modal input[name=gender]").val([ result.map.employee.gender ]);
					//将deptName的选择框的选中内容设置成数据库中查来的数据
					$("#edit_deptName").val([ result.map.employee.dId ]);
				}
			});
		}
	
		//给编辑按钮添加单击事件，由于编辑按钮是在页面加载结束后形成的，所以需要使用on()方法生成
		$(document).on("click", ".edit_emp_btn", function() {
			//调用表单重置函数
			form_reset("#edit_emp_modal form");
			//拿到点击的编辑按钮对应的员工id
			var empId = $(this).attr("emp_id");
			//将empId添加到编辑框的提交按钮，作为自定义属性的值
			$("#update_emp_btn").attr("emp_id", empId);
			//拿到点击的编辑按钮对应的员工姓名
			var empName = $(this).attr("emp_name");
			//调用获取部门信息的函数
			find_all_dept("#edit_deptName");
			//根据id获取员工信息
			find_emp_by_empId(empId);
			//显示模态框
			$("#edit_emp_modal").modal({
				backdrop : "static"
			});
		});
	
		//给编辑模态框中的保存按钮添加单击事件，单击后封装表单数据，然后发送到后端，更新数据库中的数据
		$("#update_emp_btn").click(function() {
			//调用email校验函数，若此函数返回的结果为false，则直接返回false，跳出此方法，不会发送ajax请求
			if (!checkout_email("#edit_emp_modal_email")) {
				return false;
			}
			//发送ajax请求，更新数据
			$.ajax({
				url : "${path}/employee/updateEmp.do/" + $(this).attr("emp_id"),
				type : "POST",
				data : $("#edit_emp_form").serialize() + "&_method=PUT",
				success : function(result) {
					//处理成功提示信息
					alert(result.msg);
					//跳转到末页
					to_page(currentPage);
					//隐藏模态框
					$('#edit_emp_modal').modal('hide');
				}
			})
	
		});
	
		//校验email是否符合要求
		function checkout_email(element) {
			//首先拿到编辑模态框中的email
			var email = $(element).val();
			//设置用于校验的正则表达式
			var emailReg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			//若不满足正则表达式则返回false
			if (!emailReg.test(email)) {
				show_checkout_info($(element), "failtrue", "邮箱不可用");
				return false;
			} else {
				show_checkout_info($(element), "success", "邮箱可用");
				return true;
			}
	
		}
		//校验empName是否符合要求
		function checkout_empName() {
			//首先拿到输入框的内容
			var empName = $("#add_emp_empName").val();
			//设置用于检验的正则表达式(6-16位数子字母组合或者2-5位中文字符)
			var empNameReg = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
			//判断是否符合正则表达式
			if (!empNameReg.test(empName)) { //若不符合
				show_checkout_info($("#add_emp_empName"), "failtrue", "用户名不符合要求，请输入6-16位数子字母组合或者2-5位中文字符");
				return false;
			} else {
				show_checkout_info($("#add_emp_empName"), "success", "用户名可用");
				return true
			}
		}
	
		//展示校验提示信息
		function show_checkout_info(element, status, msg) {
			//先清空原来的校验状态
			$(element).parent().removeClass("has-error has-success");
			//清空span标签的内容
			$(element).next("span").text("");
			//使用时，添加 .has-warning、.has-error 或 .has-success 类到这些控件的父元素即可
			//如果status的值为success，则表示校验成功
			if (status == "success") {
				//给输入框的父辈添加类：.has-success
				$(element).parent().addClass("has-success");
				//输入框下的信息提示框添加提示信息
				$(element).next("span").text(msg);
			} else if (status == "failtrue") {
				//给输入框的父辈添加has-error类
				$(element).parent().addClass("has-error");
				//给输入框下的信息提示框添加提示信息
				$(element).next("span").text(msg);
			}
		}
	
		//在empName输入框的内容改变时，发送ajax请求，检查用户名是否存在
		$("#add_emp_empName").change(function() {
			//拿到输入的内容
			var empName = $(this).val();
			//发送ajax请求
			$.ajax({
				url : "${path}/employee/findByEmpName.do/" + empName,
				type : "GET",
				success : function(result) {
					//拿到返回的code
					if (result.code == 1) { //表示可用
						//自定义属性，hasEmpName，其值为result.code，添加给提交按钮
						// $("#save_emp_btn").attr("hasEmpName",resule.code);
						show_checkout_info("#add_emp_empName", "success", "用户名不存在，可用");
						$("#save_emp_btn").attr("hasEmpName","success");
					} else if (result.code == 0) { //表示不可用
						//自定义属性，hasEmpName，其值为result.code，添加给提交按钮
						// $("#save_emp_btn").attr("hasEmpName",resule.code);
						show_checkout_info("#add_emp_empName", "failtrue", "用户名已存在！");
						$("#save_emp_btn").attr("hasEmpName","failtrue");
					}
	
				},
			});
		});
	
		//表单重置（完全重置：重置内容及所包含的属性），参数为作用对象
		function form_reset(ele) {
			//重置表单内容
			$(ele)[0].reset();
			//重置表单属性
			//清空表单元素中的所有子元素的has-error has-success这两个类属性
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find("span").text("");
		}
	
		//为新建按钮添加单击事件，点击发送ajax请求，获取所有部门信息，然后展示新增模态框
		$("#add_emp_btn").click(function() {
			//调用表单重置函数
			form_reset("#add_emp_modal form");
			//调用查询所有部门信息函数
			find_all_dept("#add_deptName");
			//展示添加员工模态框
			$("#add_emp_modal").modal({
				backdrop : "static"
			});
		});
	
		//点击新增模态框中的保存按钮发送ajax请求完成数据的保存
		$("#save_emp_btn").click(function() {
			//为empName添加正则校验，校验失败则直接退出此方法
			if (!checkout_empName()) {
				return false;
			}
			/* //拿到用户名
			var empName = $("#add_emp_empName").val();
			//检查用户名是否存在
			if(!hasNoEmp(empName)){
				return false;
			} */
			//拿到此按钮的hasEmpName属性，判断是否其值
			if($(this).attr("hasEmpName") == "failtrue"){
				return false;
			}
			//为email添加正则校验，校验失败则直接退出此方法
			if (!checkout_email("#add_emp_modal_email")) {
				return false;
			}
			//发送ajax请求，完成数据的插入操作
			$.ajax({
				url : "${path}/employee/saveEmp.do",
				type : "POST",
				data : $("#add_emp_form").serialize(),
				success : function(result) {
					//弹出提示信息
					alert(result.msg);
					//关闭模态框
					$("#add_emp_modal").modal("hide");
					//跳转到最后一页
					to_page(totalPages);
				}
			});
		});
	</script>


</body>
</html>
