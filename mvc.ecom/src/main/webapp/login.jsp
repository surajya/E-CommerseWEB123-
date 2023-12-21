
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login-mycart</title>
<%session.removeAttribute("current_user");
%>
<%@include file="components/common_css_js.jsp"%>
<%@include file="components/navbar.jsp"%>
</head>
<body>
	<div class="row mt-5">
		<div class="col-md-4 offset-md-4">
			<div class="card px-5">
				<div class="card-header">
					<h5 class="mt-3">Login Form</h5>
				</div>
				<div class="card-body">
					
					<form action="Login" method="post">
					<%@include file="components/message.jsp"%>
						<div class="form-group">
							<label for="exampleInputEmail1">Email Address</label> <input
								type="email" class="form-control" id="exampleInputEmail"
								name="userEmail" aria-describedby="userNameHelp"
								placeholder="Enter Email Address">
						</div>
						<div class="form-group">
							<label for="exampleInputpassword">Password</label> <input
								type="password" class="form-control" id="exampleInputpassword"
								name="userPassword" aria-describedby="passwordHelp"
								placeholder="Enter Password">
						</div>
						
						
						<div>
						<a href="register.jsp">if not register! click here</a><br><br>
							<button type="submit" class="btn btn-primary mb-2">Login</button>
							<button type="submit" class="btn btn-primary mb-2">Forget
								Password</button>
						</div>
						<div class="card-footer"></div>
					</form>
				</div>
			</div>

		</div>
	</div>

</body>
</html>