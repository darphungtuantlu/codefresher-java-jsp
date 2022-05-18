<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


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
	
	<c:if test="${error !=null }">
		<h1>${error}</h1>
	</c:if>
	<form:form method="post" action="/save/student" modelAttribute="student" enctype="multipart/form-data" onsubmit="return validateNameLength()"	 >
		 <label for="id">id</label><br> <!-- tại sao run lên id = 0 ? mà add vào bằng 1  -->
		  <form:input type="text" id="id" name="id" path="id" readonly="true" />
			
		  <label for="firstName">First name:</label><br>
		  <form:input type="text" path="firstName" id="firstName" name="firstName" required="true" />
		  
		  <label for="lname">Last name:</label>
		  <form:input type="text" id="lname" name="lname" path="lastName" />
		  
		  <label for="age">Age:</label>
		  <form:input type="text" id="age" name="age" path="age" />
		  
		  <label for="lophoc">Lop Hoc:</label>
		  <form:input type="text" id="lophoc" name="lophoc" path="lopHoc" />
		 <br>
		 <form:input type="file" path="avatar" id="avatar" name="avatar" onchange="showImage(this)"    />
		 
		 <div class="showImage" style="width:200px; height: 200px">
		 	<img alt="anh o day" class = "image" id = "anhXemTruoc">
		 </div>
		  <button type="submit" >save</button>
	</form:form>
	
	<script type="text/javascript">
		function showImage(input){
			if(input.files && input.files[0]){
				var reader = new FileReader();
				
				reader.onload = function(e){
					$('#anhXemTruoc').attr('src', e.target.result)
					.width(150)
					.height(150);
				};
				reader.readAsDataURL(input.files[0]);
			}	
		}

		
		function boolean validateNameLenght(name){
			var firstName = document.getElementById("firstName").value;
			if(firstName.length()<5){
				alert("firstName do dai phải lớn hơn 5 ký tự!");
				return false;
			}else{
				return true;
			}
			
		}
	</script>
	
</body>
</html>