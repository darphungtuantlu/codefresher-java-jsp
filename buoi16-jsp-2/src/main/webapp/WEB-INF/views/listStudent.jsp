<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/css/style.css">

<title>Document</title>
</head>
<body>
	<h1>Hello codeFresher ! JSP PAGE</h1>

	<h2>show information Student</h2>
	
	
	<button style="width: 100px;height: 50px"> <a href="/form/student">Add Student</a></button>
	
	<table style="width: 50%; border: 1px">
		<tr>
			<th>stt</th>
			<th>id</th>
			<th>first name</th>
			<th>last name</th>
			<th>age</th>
			<th>lop</th>
			<th>Avatar</th>
			
		</tr>

		<c:forEach items="${listStudent}" var="studentDinhDanh" varStatus="s">
			<tr>
				<td>${s.index + 1}</td>
				<td>${studentDinhDanh.id}</td>
				<td style="color: red">${studentDinhDanh.firstName}</td>
				<td>${studentDinhDanh.lastName}</td>
				<td>${studentDinhDanh.age}</td>
				<td>${studentDinhDanh.lopHoc}</td>
				<td>${studentDinhDanh.avatar}</td>
				<td><a href="deleted/student?id=${studentDinhDanh.id}" onclick="return confirm('ban co chac muon xoa khong ?')">delete</a></td>
				<td><a href="/update/student?id=${studentDinhDanh.id}">Update</a></td>

			</tr>
		</c:forEach>
		
	</table>

	<!-- them file vao trang web --> 
</body>
</html>