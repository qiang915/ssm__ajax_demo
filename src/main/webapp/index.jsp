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

	<div class="container">
		<div class="row">
			<div class="col-md-12"></div>
		</div>
		<div class="row" style="margin-top: 150px;">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title">登录界面</h3>
					</div>
					<div class="panel-body">
						<form class="form-horizontal" id="login_form">
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">Username</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="username"
										placeholder="Username"> <span class="help-block"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">Password</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="password"
										placeholder="password"><span class="help-block"></span>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button id="login_btn" type="submit" class="btn btn-default">Sign
										in</button>
								</div>
							</div>
						</form>
					</div>
					<div class="panel-footer">开发者：卫强</div>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>

	</div>

	<script type="text/javascript">
	
		/* 给登录按钮添加单击事件 */
		$("#login_btn").click(function() {
			//监测用户是否存在
			if ($("#login_btn").attr("has_user") == "yes") {
				//监测密码是否正确
				if ($("#login_btn").attr("checkout_password") == "yes") {
					//实现页面跳转，即给表单添加action属性
					$("#login_form").attr("action", "user/toList");
				} 
			}
		});
	
		/* 给密码输入框添加内容改变事件 */
		$("#password").change(function() {
			//首先拿到输入的用户名
			var username = $("#username").val();
			//拿到输入的密码
			var inputPassword = $("#password").val();
			//发送ajax请求，以username为条件查询用户
			$.ajax({
				url : "${path}/user/findByUsername.do/" + username,
				type : "GET",
				success : function(result) {
					//若存在此用户，则比较密码是否正确
					if (result.code == 1) {
						if (result.map.user.password == inputPassword) {
							//显示正确提示信息
							show_tip("#password", "success", "密码正确");
							//给登录按钮添加自定义属性，以备在后面提交时作验证
							$("#login_btn").attr("checkout_password", "yes");
						} else {
							//显示错误提示信息
							show_tip("#password", "failtrue", "密码错误！");
							$("#login_btn").attr("checkout_password", "no");
						}
					}
				},
			});
		});
	
		/* 为用户名输入框添加内容改变事件 */
		$("#username").change(function() {
			/* 先发送ajax请求，判断用户是否存在 */
			//首先拿到输入的用户名
			var username = $("#username").val();
			//发送ajax请求，以username为条件查询用户
			$.ajax({
				url : "${path}/user/findByUsername.do/" + username,
				type : "GET",
				success : function(result) {
					//若存在此用户，则显示提示信息
					if (result.code == 1) {
						show_tip("#username", "success", "存在此用户！");
						//给提交按钮，添加自定义属性，后期用作是否可提交条件
						$("#login_btn").attr("has_user", "yes");
					}
					//若不存在此用户，则显示提示信息
					if (result.code == 0) {
						show_tip("#username", "failtrue", "用户不存在，请检查你的用户名是否正确！");
						//给提交按钮，添加自定义属性，后期用作是否可提交条件
						$("#login_btn").attr("has_user", "no");
					}
				},
			});
		});
	
		//提示信息的显示
		function show_tip(element, status, msg) {
			//先清除原有状态
			$(element).parent().removeClass("has-success has-error");
			$(element).next("span").text("");
			//成功状态
			if (status == "success") {
				//给输入框的父辈添加属性has-success
				$(element).parent().addClass("has-success");
				//给同辈的span添加提示内容
				$(element).next("span").text(msg);
			}
			//失败状态
			if (status == "failtrue") {
				//给输入框的父辈添加属性has-error
				$(element).parent().addClass("has-error");
				//给同辈的span添加提示内容
				$(element).next("span").text(msg);
			}
		}
	</script>



</body>
</html>