<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Sale Course</title>

        <!-- Bootstrap 5 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link rel="stylesheet" href="/css/style.css" type="text/css"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        
        <!-- jQuery -->
    	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    	
        <script type="text/javascript">
        	function getSelectedCourse(){
				var selectedCourse = document.getElementById('courseName').value;
				//alert(selectedCourse);
				if(selectedCourse != ""){
					var xhr = new XMLHttpRequest();
					xhr.open("GET","/getCoursePrices?selectedCourse="+selectedCourse,true);
					xhr.onreadystatechange = function(){
						if(xhr.readyState ===  4 && xhr.status == 200){
							var response = JSON.parse(xhr.responseText);
							//alert(response);
							var product = response;
							var discountedPrice = product.discountedPrice;
							var originalPrice = product.originalPrice;
							//alert(originalPrice);
							//alert(discountedPrice);
							document.getElementById('originalPriceId').textContent = originalPrice;
							document.getElementById('discountedPriceId').textContent = discountedPrice;
							
							$('#priceId').css("visibility", "visible");
						}
					};
					xhr.send();
				}else{
					$('#priceId').css("visibility", "hidden");
				}
			}
        </script>
    </head>
    <body>
    	<!-- Header -->
       <jsp:include page="header-employee.jsp"/>
       
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
                    <h4 class="text-center mb-4">Sale Course</h4>

                    <form:form style="text-align: left;" action="saleCourseForm" method="post" modelAttribute="modelSaleCourseAttr">
                        <!-- Name Field -->
                        <div class="form-group mb-3">
                            <label for="phoneNo">Customer Phone Number</label>
                            <form:input  cssClass="form-control" id="phoneNo" path="custPhoneNo" placeholder="Enter Phone Number"/>
                            <form:errors path="custPhoneNo" cssClass="error_message_design"/>
                        </div>
                        <div class="mb-3">
                                <label for="courseName">Interested Course</label>
                                <form:select cssClass="form-select" id="courseName" path="courseName" onchange="getSelectedCourse()">
                                    <form:option value="">Select Course</form:option>
                                    <form:options items="${model_coursename_list}"/>
                                </form:select>
                                <form:errors path="courseName" cssClass="text-danger"/>
                        </div>
                        <div class="mb-3" style="visibility: hidden;" id="priceId">
                        		Price to pay : <strong><del>Rs.<span id="originalPriceId" style="color: red;"></span></del></strong>&nbsp;&nbsp; Rs.<span id="discountedPriceId"  class="text-primary"></span>
                        </div>
					    <!-- Submit Button -->
                        <button type="submit" class="btn btn-primary w-100">Sell Course</button>
                    </form:form>
                </div>
                <div class="col-3"></div>
            </div>
        </div>
    </body>
</html>
