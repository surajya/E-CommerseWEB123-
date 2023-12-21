<%@ page import="mvc.ecom.entity.*" import="mvc.ecom.dao.*" import="mvc.ecom.helper.FactoryProvider" import="mvc.ecom.entity.Category" import="java.util.*"%>

<%
User user = (User) session.getAttribute("current_user");
if (user == null) {
	session.setAttribute("message", "invalid user first login with admin user");
	response.sendRedirect("login.jsp");
} else {
	if (user.getUserType().equals("Normal")) {
		session.setAttribute("message", "you are normal user, first create credintial of admin");
		response.sendRedirect("login.jsp");
	}
}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="components/common_css_js.jsp"%>
<title>Admin page</title>
</head>
<body>
	<%@ include file="components/navbar.jsp"%>
	<div class="container admin">

		<div class="container-fluid mt-3">
			<%@ include file="components/message.jsp"%>
		</div>

		<div class="row mt-3">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img class="rounded-circle" class="img-fluid"
								style="max-width: 125px" alt="user_pic" src="img/user.png">
						</div>
						<h1><%=UserDao.TotalUsers() %></h1>
						<h1>Users</h1>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img class="rounded-circle" class="img-fluid"
								style="max-width: 125px" alt="categories" src="img/menu.png">
						</div>
						<h1><%
						CategoryDao cd=new CategoryDao(FactoryProvider.getFactory());
						List<Category> cc=cd.getCategory();
						%><%=cc.size() %></h1>
						<h1>Categories</h1>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img class="rounded-circle" class="img-fluid"
								style="max-width: 125px" alt="user_pic" src="img/product.png">
						</div>
						<%ProductDao pd=new ProductDao(FactoryProvider.getFactory());
						     List<Product> pp=pd.getProduct();
						%>
						<h1><%=pp.size() %></h1>
						<h1>Products</h1>
					</div>
				</div>
			</div>

		</div>

		<!-- second row -->
		<div class="row mt-3">
			<div class="col-md-6">
				<div class="card" data-toggle="modal" data-target="#add-categories">
					<div class="card-body text-center">
						<div class="container">
							<img class="rounded-circle" class="img-fluid"
								style="max-width: 125px" alt="user_pic" src="img/calculator.png">
						</div>
						<h1>Add Categories</h1>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card" data-toggle="modal" data-target="#Add-Product">
					<div class="card-body text-center">
						<div class="container">
							<img class="rounded-circle" class="img-fluid"
								style="max-width: 125px" alt="user_pic" src="img/add.png">
						</div>
						<h1>Add Product</h1>
					</div>
				</div>
			</div>

		</div>
	</div>


	<!-- Add categories for my mycard website-->
	<!-- Button trigger modal -->

	<!-- Modal -->
	<div class="modal fade" id="add-categories" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel " aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title " id="exampleModalLabel">Fill Category
						Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<!-- Start Form -->
				<div class="card">
					<div class="card-body">
						<form action="ProductOperationServlet" method="post">
							<input type="hidden" name="operation" value="addCategory">
							<div class="form-group mt-3">
								<input type="text" class="form-control" name="catTitle"
									placeholder="Enter categoryTitle" required>
							</div>
							<div class="form-group">
								<textarea style="height: 200px" class="form-control"
									name="catDiscription"
									placeholder="Enter discription of category" required></textarea>
							</div>
							
							<div class="form-group text-center">
								<input type="submit" class="btn btn-primary">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
							</div>
						</form>
					</div>

				</div>
				<!-- End Form -->
			</div>
		</div>
	</div>
	<!-- End categories for myecard website -->




	<!-- Add Product -->
	<!-- The Modal -->
	<div class="modal fade" id="Add-Product" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Fill Product
						Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<!-- Start form -->
				<div class="card">

					<div class="card-body">
						<form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
							<input type="hidden" name="operation" value="addProduct">
							<div class="form-group mt-3">
								<input type="text" class="form-control" name="pName"
									placeholder="Enter Product Title" required>
							</div>

							<div class="form-group">
								<textarea style="height: 150px" type="text" class="form-control"
									name="pDiscription" placeholder="Enter Product Discription"
									required></textarea>
							</div>
							<div class="form-group">
								<input type="number" class="form-control" name="pPrice"
									placeholder="Enter Product Price" required>
							</div>
							<div class="form-group">
								<input type="number" class="form-control" name="pDiscount"
									placeholder="Enter Product Discount" required>
							</div>
							<div class="form-group">
								<input type="number" class="form-control" name="pQuantity"
									placeholder="Enter Product Quantity" required>
							</div>
							
							<div class="form-group">
								<select name="CID" class="form-control" required>
								<%
								CategoryDao categoryDao=new CategoryDao(FactoryProvider.getFactory());
								List<Category> list=categoryDao.getCategory();
								
								for(Category cat:list){
								%>
									<option value="<%=cat.getCategoryId()%>"><%= cat.getCategoryTitle()%></option>
									<%} %>
								</select>
							</div>
							
							<div class="form-group">
								<label for="pPic"> Select Picture of Product</label><br>
								<input id="pPic" type="file" name="pPic" required>
							</div>
							
							<div class="form-group text-center">
								<input type="submit" class="btn btn-primary">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
							</div>
						</form>
					</div>
				</div>

				<!-- End Form -->
			</div>
		</div>
	</div>

	<!-- End Product -->

</body>
</html>