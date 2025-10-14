<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Login</title>
  
  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="css/style.css" type="text/css"/>
</head>
<body>
	
    <div class="container-fluid p-0 m-0">
       <!--- Header --->
        <jsp:include page="header-crm.jsp"/>
        <!--- Login --->
        <div class="container-fluid" style="float: left; padding-top: 20px;">
            <div class="row">
                <div class="col-3"></div>
                <div class="col-6  bg-light" style="text-align: center;padding: 40px;border-radius: 20px;">
               		<c:if test="${not empty model_error}">
					    <h5 style="color: red;">${model_error}</h5>
					</c:if>
                    <h3>Login Here</h3>
					<!--  Form   -->
                    <form style="margin-top: 20px; text-align: left;" action="LoginForm" method="post">
                        <!-- Email Field -->
                        <div class="form-group mb-3">
                            <label for="email">Email address</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter email">
                        </div>

                        <!-- Password Field -->
                        <div class="form-group mb-3">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                        </div>
                        <!-- Submit Button -->
                        <button type="submit" class="btn btn-primary w-100" value="submit">Login</button>
                    </form>
                </div>
                
                <div class="col-3"></div>
            </div>
        </div>
    </div>
</body>
</html>
    