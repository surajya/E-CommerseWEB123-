<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registraction</title>
<%@include file="components/common_css_js.jsp"%>
<%@include file="components/navbar.jsp"%>
</head>
<body>
	<div class="row mt-3">
		<div class="col-md-4 offset-md-4">
			<div class="card px-5">
				<div class="card-body">
					<form action="RegisterServlet" method="post">
						<%@include file="components/message.jsp"%>
						<h3 class="text-center mt-0">Registration Form</h3>
						<div class="form-group">
							<label for="exampleInputEmail1">UserName</label> <input
								type="text" class="form-control" id="exampleInputusername"
								name="userName" aria-describedby="userNameHelp"
								placeholder="Enter UserName">
						</div>
						<div class="form-group">
							<label for="exampleInputpassword">Password</label> <input
								type="password" class="form-control" id="exampleInputpassword"
								name="userPassword" aria-describedby="passwordHelp"
								placeholder="Enter Password">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Phone</label> <input type="text"
								class="form-control" id="exampleInputEmail1" name="userPhone"
								aria-describedby="phoneHelp"
								placeholder="Please 10 digit number">
						</div>
						<div class="form-group">
							<label for="exampleFormControlFile1">email</label> <input
								type="text" class="form-control-file"
								id="exampleFormControlFile1" name="userEmail"
								placeholder="Enter UserEmail">
						</div>
						<div class="form-group">
							<label for="exampleInputaddress">Address</label>
							<textarea style="height: 100px;" class="form-control"
								placeholder="Enter address" name="userAddress"></textarea>
						</div>

						<div>
						<a href="login.jsp">if already register! click here</a><br><br>
							<button type="submit" class="btn btn-primary mb-2">Register</button>
							<button type="reset" class="btn btn-primary mb-2">Reset</button>
						</div>

					</form>
				</div>
			</div>

		</div>
	</div>

</body>
</html>