<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
	<html lang="en">
	<head>
	  <meta charset="UTF-8">
	  <title>Employee's List</title>

	  <!-- Bootstrap 5 -->
	  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">	  
	  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	  <link rel="stylesheet" href="/css/style.css" type="text/css"/>
	  <script>
	  			function confirmDetailsDelete(empEmail){
						//alert('hi :'+empEmail);
						$('#deleteEmpConfirmationModel').modal('show');
						$('#deleteEmployee').attr('href','/deleteEmployee?empEmail='+empEmail);
				}
	  			function openUpdateModal(email, name, phone,password) {
	  			    $('#updateEmpEmail').val(email);
	  			    $('#updateEmpName').val(name);
	  			    $('#updateEmpPhone').val(phone);
	  			    $('#updateEmpPass').val(password);
	  			    $('#updateEmployeeModal').modal('show');
	  			}
	  </script>
	</head>
	<body>
	 <!-- Header -->
  		<jsp:include page="header-admin.jsp"/>
  		<div class="container mt-3">
	</div>
  		<!-- Employee Details -->
	    <div class="container mt-3">  
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
	    <h3 style="color: blue;font-weight: bold;margin-bottom: 20px;">Employee's Details</h3>
	    <table class="table table-light table-bordered table-hover">
	        <thead class="table-dark">
	        <tr style="text-align: center;">
	        	  <th>S.No.</th>
		          <th>Full Name</th>
		          <th>Email Address</th>
		          <th>Phone Number</th>
		          <th>Update </th>
		          <th>Delete</th>
	        </tr>
	      </thead>
	      <tbody>
	      <c:set var="i" value="${(model_currentPage-1)*model_PageSize+1}"/>
	        <c:forEach var="employee" items="${model_List_Emp}">
	        		<tr style="text-align: center;">
	        				<td>${i}.</td>
	        				<td>${employee.getName()}</td>
	        				<td>${employee.getEmail()}</td>
	        				<td>${employee.getPhoneNo()}</td>
	        				<td>
	        						<button type="button" class="btn btn-success"
									        		onclick="openUpdateModal('${employee.getEmail()}', '${employee.getName()}', '${employee.getPhoneNo()}', '${employee.getPassword()}')">
									    			<i class="bi bi-pencil-square"></i>
									</button>
	        				</td>
	        				<td>
	        						<button type="button" class="btn btn-danger" onclick="confirmDetailsDelete('${employee.getEmail()}')">
	        									<i class="bi bi-trash"></i>
	        						</button>
	        				</td>
	        		</tr>
	        		<c:set var="i" value="${i+1}"/>
	        </c:forEach>
	      </tbody>
	    </table>
	 <nav aria-label="Page navigation">
		  <ul class="pagination justify-content-center">
		
		    <!-- Prev Button -->
		    <c:choose>
		    		 	<c:when test="${model_currentPage > 1}">
					      <li class="page-item">
					        <a class="page-link" href="/empList?page=${model_currentPage - 1}" aria-label="Previous">
					          <span aria-hidden="true">&laquo; Prev</span>
					        </a>
					      </li>
					    </c:when>
					    <c:when test="${model_currentPage == 1}">
					      <li class="page-item disabled">
					        <a class="page-link" href="/empList?page=${model_currentPage - 1}" aria-label="Previous">
					          <span aria-hidden="true">&laquo; Prev</span>
					        </a>
					      </li>
					    </c:when>
		    </c:choose>
		
		    <!-- Page Numbers -->
		    <c:forEach var="pageNumber" begin="1" end="${model_totalPages}">
		      <c:choose>
		        <c:when test="${pageNumber == model_currentPage}">
		          <li class="page-item active" aria-current="page">
		            <span class="page-link">${pageNumber}</span>
		          </li>
		        </c:when>
		        <c:otherwise>
		          <li class="page-item">
		            <a class="page-link" href="/empList?page=${pageNumber}">${pageNumber}</a>
		          </li>
		        </c:otherwise>
		      </c:choose>
		    </c:forEach>
		
		    <!-- Next Button -->
		    <c:choose>
		    		 	<c:when test="${model_currentPage < model_totalPages}">
					      		<li class="page-item">
								        <a class="page-link" href="/empList?page=${model_currentPage + 1}" aria-label="Next">
								          <span aria-hidden="true">Next &raquo;</span>
								        </a>
						      	</li>
					    </c:when>
					    <c:when test="${model_currentPage == model_totalPages}">
					     	<li class="page-item disabled">
		       					 <a class="page-link" href="/empList?page=${model_currentPage + 1}" aria-label="Next">
		          				<span aria-hidden="true">Next &raquo;</span>
		        				</a>
		      				</li>
					    </c:when>
		    </c:choose>
		  </ul>
		</nav>
		<!--   ===================== Delete Employee ===================== -->
				<!-- Modal -->
				<div class="modal fade" id="deleteEmpConfirmationModel" tabindex="-1" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				    
				    <!-- Modal header -->
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel"><b>Delete Employee</b></h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      
				      <!-- Modal Body -->
				      <div class="modal-body">
				            Are you sure you want to delete this employee ?
				      </div>
				      
				      <!--  Modal Footer -->
				      <div class="modal-footer">
				        <a type="button" class="btn btn-danger"  id="deleteEmployee">Delete</a>
				        <button type="button" class="btn btn-secondary"data-bs-dismiss="modal">Close</button>
				      </div>
				    </div>
				  </div>
				</div>
				
				<!--   ===================== Update Employee ===================== -->
				<div class="modal fade" id="updateEmployeeModal" tabindex="-1" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered">
				    <div class="modal-content">
				
				      <!-- Modal Header -->
				      <div class="modal-header">
				        <h5 class="modal-title"><b>Update Employee Details</b></h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				
				      <!-- Modal Body -->
				      <form action="/updateEmployeeDetails" method="post">
				        <div class="modal-body " style="max-height: 50vh;overflow-y:auto">
				          <div class="mb-3">
				            <label for="updateEmpName" class="form-label">Full Name</label>
				            <input type="text" class="form-control" id="updateEmpName" name="empName" required>
				          </div>
				          <div class="mb-3">
				            <label for="updateEmpEmail" class="form-label">Email</label>
				            <input type="email" class="form-control" id="updateEmpEmail" name="empEmail" readonly>
				          </div>
				          <div class="mb-3">
				            <label for="updateEmpPhone" class="form-label">Phone Number</label>
				            <input type="text" class="form-control" id="updateEmpPhone" name="empPhone" required>
				          </div>
				          <div class="mb-3">
				            <label for="updateEmpPass" class="form-label">Password</label>
				            <input type="text" class="form-control" id="updateEmpPass" name="empPass" required>
				          </div>
				        </div>
				        <!-- Modal Footer -->
				        <div class="modal-footer">
				          <button type="submit" class="btn btn-success">Update</button>
				          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
				        </div>
				      </form>
				        </div>
				    </div>
				  </div>
				</div>
			</div>
		</body>
	</html>
    