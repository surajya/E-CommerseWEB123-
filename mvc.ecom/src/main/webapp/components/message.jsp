<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String message=(String)session.getAttribute("message");
if(message!=null) {
	%>
	<div class="alert alert-success" role="alert">
  <%= message %>
</div>
	<%
}
session.removeAttribute("message");
%>
</body>
</html>