<%@ page import="mvc.ecom.entity.User"%>

<%
User user1 = (User) session.getAttribute("current_user");
System.out.println("this is navbar: "+user1);
%>

<nav class="navbar navbar-expand-lg navbar-dark "
	style="background-color: #039BE5">
	<div class="container">
		<a class="navbar-brand" href="index.jsp">Mycart</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp">Home <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> categories </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>
				</li>
			</ul>
			
			
			<ul class="navbar-nav ml-auto">
			<%
			if (user1==null) {
			%>
				<li class="nav-item active"><a class="nav-link"
					href="#!"><i class="fa fa-shopping-cart" data-toggle="modal" data-target="#cart"></i><span class="ml-0 cart-items">()</span></a></li>
				<li class="nav-item active"><a class="nav-link"
					href="login.jsp">Login</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="register.jsp">Regiser</a></li>
			</ul>
			<%
			} else {
			%>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href="#"> <%=
						user1.getUserName()
						%>
				</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="login.jsp">Logout</a></li>
			</ul>

			<%
			}
			%>

		</div>
	</div>
</nav>
