<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
	<style>
	div.container {
		height: 50%;
		width: 100%;
		padding-top: 15%;
	}
	div.login {
	    text-align: center;
		height: 100%;
		width: 50%;
		padding-left: 25%;
		padding-right: 25%;
	}
	.login-form {
		width: 30%;
		height: 30px;
		
	    box-shadow: 2px 2px 6px grey;
	}
	.login-form:hover {
	    box-shadow: 4px 4px 6px grey;
	}

	.button {
		background-color: skyblue;
		color: white;
		border: none;
	}
	#error {
		color: #f59b5a;
		
		width: 40%;
		height: 20%;
		margin-left: 30%;
		margin-right: 30%;
		cursor: context-menu;
		display: none;
	}
	</style>
<body>
	<div class="container">
		<div class="login">
			<form action="Login" method="post">
				<input type="text" id="login-id" class="login-form" name="id" placeholder=" ID" required><br><br>
				<input type="password" id="login-pw" class="login-form" name="pw" placeholder=" Password" required><br><br>
				<input type="submit" class="login-form button" value="ENTER">
			</form>
			<h2 id="error" style="display:${sessionScope.user}">INVALID PASSWORD</h2>
			<div id="test"></div>
		</div>
	</div>
</body>
</html>