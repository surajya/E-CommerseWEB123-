<%@page import="org.hibernate.SessionFactory" import="java.util.*"%>
<%@page import="mvc.ecom.helper.FactoryProvider"
	import="mvc.ecom.dao.ProductDao" import="mvc.ecom.entity.Product"%>
<%@page import="mvc.ecom.entity.Category"
	import="mvc.ecom.dao.CategoryDao" import="mvc.ecom.helper.*"%>
<html>
<head>
<meta charset="UTF-8">
<title>MyCart Page</title>
<%@include file="components/common_css_js.jsp"%>
<%@include file="components/navbar.jsp"%>
<link rel="stylesheet" href="css/style.css">
</head>

<body>
	<div class="container-fluid">
		<div class="row mt-3 ml-4">

			<div class="col-md-2 mt-4">
				<%
				CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
				List<Category> list = categoryDao.getCategory();
				%>

				<div class="list-group">
					<a href="index.jsp?category=All"
						class="list-group-item list-group-item-action active custom-bg">
						All Category
					</a>
					<%
					for (Category cat : list) {
					%>
					<a href="index.jsp?category=<%=cat.getCategoryId() %>" style="a:active {color:blue}" class="list-group-item list-group-item-action"><%=cat.getCategoryTitle()%></a>
					<%
					}
					%>
				</div>


			</div>

			<!-- SHOW PRODUCT -->
			<div class="col-md-10">
				<%
				String str=request.getParameter("category");
				
				ProductDao pd = new ProductDao(FactoryProvider.getFactory());
				List<Product> allP=null;
				if(str==null || str.trim().equals("All")) allP= pd.getProduct();
				else{
					int cid=Integer.parseInt(str);
					allP=pd.getProductById(cid);
				}
				 if(allP.size()==0){
					 %>
					 	<p>No Items are present</p>
					 <%
				 }
				%>

				<!-- row -->
				<div class="row mt-4">

					<!-- col:12 -->
					<div class="col-md-12">

						<div class="card-columns">

							<!-- Traversing product -->
							<%
							for (Product p : allP) {
							%>
							<div class="card">
								<div class="card-body">
									<div class="container text-center">
										<img class="card-img-top "
											style="max-height: 300px; max-width: 100%; width: auto"
											src="img/Products/<%=p.getpPhoto()%>" alt="Card image cap">
									</div>
									<h5><%=p.getpTitle()%></h5>

									<p><%=Get10Word.getWord(p.getpDesc())%>
								</div>
								<div class="card-footer">
									<button class="btn custom-bg" onclick="add_to_cart(<%= p.getpId()%>,'<%=p.getpTitle()%>',<%=AfterDiscount.disPrice(p.getpPrice(), p.getpDiscount())%>)">Add to Cart</button>
									<button class="btn">
										&#8377;<%=AfterDiscount.disPrice(p.getpPrice(), p.getpDiscount())%></button>
									<button class="btn btn-outline-primary" >
										&#8377;
										<del><%=p.getpPrice()%></del><span class="text-secondary discount-label" >  <%=p.getpDiscount() %>%off</span>
									</button>
								</div>
							</div>
							<%
							}
							%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="components/common_modal.jsp" %>>
</body>
</html>
