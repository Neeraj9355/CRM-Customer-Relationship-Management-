<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Add Employee</title>

        <!-- Bootstrap 5 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link rel="stylesheet" href="/css/style.css" type="text/css"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    </head>
    <body>
    	<!-- Header -->
       <jsp:include page="header-admin.jsp"/>
       
        <div class="container-fluid pt-3">
	        <c:if test="${not empty model_success}">
	        		<div class="row">
			        	<div class="alert alert-success alert-dismissible fade show" role="alert">
							 ${model_success}
							  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
			        </div>
	        </c:if>
	        <c:if test="${not empty model_error}">
	        		<div class="row">
			        	<div class="alert alert-danger alert-dismissible fade show" role="alert">
							 ${model_error}
							  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
			        </div>
	        </c:if>
            <div class="row">
                <div class="col-3"></div>
                <div class="col-6 bg-light" style="padding: 40px; border-radius: 20px;">
                    <h4 class="text-center mb-4">Add Employee</h4>

                    <form:form style="text-align: left;" action="AddEmployee" method="post" modelAttribute="modelEmpAttr">
                        <!-- Name Field -->
                        <div class="form-group mb-3">
                            <label for="name">Full Name</label>
                            <form:input type="text" cssClass="form-control" id="name" path="name" placeholder="Enter full name"/>
                            <form:errors path="name" cssClass="error_message_design"/>
                        </div>

                        <!-- Email Field -->
                        <div class="form-group mb-3">
                            <label for="email">Email Address</label>
                             <form:input type="email" cssClass="form-control" id="email" path="email" placeholder="Enter email"/>
                             <form:errors path="email" cssClass="error_message_design"/>
                        </div> 

                        <!-- Password Field -->
                        <div class="form-group mb-3">
                            <label for="password">Password</label>
                            <form:password cssClass="form-control" id="password" path="password" placeholder="Enter password" />
                            <form:errors path="password" cssClass="error_message_design"/>
                        </div>

                        <!-- Phone Number Field -->
                        <div class="form-group mb-4">
                            <label for="phoneNo">Phone Number</label>
                             <form:input type="text" cssClass="form-control" id="phoneNo" path="phoneNo" placeholder="Enter phone number" />
                             <form:errors path="phoneNo" cssClass="error_message_design"/>
                        </div>

                        <!-- Submit Button -->
                        <button type="submit" class="btn btn-primary w-100">Register</button>
                    </form:form>
                </div>
                <div class="col-3"></div>
            </div>
        </div>
    </body>
</html>
