<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
		<meta charset="utf-8">
		 <title>登录页面-</title> 
		<link rel="stylesheet" href="css/reset.css" />
		<link rel="stylesheet" href="css/common.css" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />
		<script type="text/javascript" src="js/jquery.min.js" ></script>
		<script type="text/javascript" src="js/common.js" ></script>
	</head>
	<body>
		<div class="wrap login_wrap">
			<div class="content">
				<div class="logo"></div>
				<div class="login_box">	
					
					<div class="login_form">
						<div class="login_title">
							登录
						</div>
						<form action="#" method="post">
							<div class="form_text_ipt">
								<input  id="form_name"name="name" type="text" placeholder="手机号/邮箱">
							</div>
							<div class="ececk_warning" id="err_name"><span>手机号/邮箱不能为空</span><input type="hidden" id="name_err_msg" value="${param.nameMsg }"/></div>
							<div class="form_text_ipt">
								<input id="form_pwd" name="password" type="password" placeholder="密码">
							</div>
							<div class="ececk_warning" id="err_pwd"><span>密码不能为空</span><input type="hidden" id="pwd_err_msg" value="${param.pwdMsg }"/></div>
							<div class="form_check_ipt">
								<div class="left check_left">
									<label><input name="" type="checkbox"> 下次自动登录</label>
								</div>
								<div class="right check_right">
									<a href="#">忘记密码</a>
								</div>
							</div>
							<div class="form_btn">
								<button type="button" onclick="postSubmit()">登录</button>
							</div>
							<script type="text/javascript">
							//密码错误消息
							var msg= $("#pwd_err_msg").val();
							if(msg && /[^\s]/.test(msg)) {
								$("#err_pwd").children().html(msg);
								$("#err_pwd").css("display","block");
							}
							var name_msg=$("#name_err_msg").val();
							if(name_msg && /[^\s]/.test(name_msg)) {
								$("#err_name").children().html(name_msg);
								$("#err_name").css("display","block");
							}
							//Post方式提交表单  
								function postSubmit() {  
									var postUrl = "/login/toLogin"; //提交地址
									var ExportForm = document.createElement("FORM");
									var nameVal=$("#form_name").val();
									var pwdVal=$("#form_pwd").val();
									if(!(nameVal && /[^\s]/.test(nameVal))) {
										 $("#err_name").children().html("手机号/邮箱不能为空");
										 $("#err_name").css("display","block");
										 return;
									}
									if(!(pwdVal && /[^\s]/.test(pwdVal))) {
										 $("#err_pwd").children().html("密码不能为空");
										 $("#err_pwd").css("display","block");
										 return;
									}   
									
									document.body.appendChild(ExportForm);
									ExportForm.method = "POST";
									var name = document.createElement("input");
									name.setAttribute("name", "name");
									name.setAttribute("type", "hidden");
									name.value = nameVal;
									ExportForm.appendChild(name);

									var pwd = document.createElement("input");
									pwd.setAttribute("name", "password");
									pwd.setAttribute("type", "hidden");
									pwd.value = pwdVal;
									ExportForm.appendChild(pwd);
									ExportForm.action = postUrl;
									ExportForm.submit();
								}
							</script>
							<div class="form_reg_btn">
								<span>还没有帐号？</span><a href="/register/toRegister">马上注册</a>
							</div>
						</form>
<!-- 						<div class="other_login">
							<div class="left other_left">
								<span>其它登录方式</span>
							</div>
							<div class="right other_right">
								<a href="#"><i class="fa fa-qq fa-2x"></i></a>
								<a href="#"><i class="fa fa-weixin fa-2x"></i></a>
								<a href="#"><i class="fa fa-weibo fa-2x"></i></a>
							</div>
						</div> -->
					</div>
				</div>
			</div>
		</div>
		<div style="text-align:center;">
</div>
</body>
</html>
