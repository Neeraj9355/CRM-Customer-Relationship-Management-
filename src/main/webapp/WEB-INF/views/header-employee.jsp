<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<header class="container-fluid bg-primary text-white py-4">
			  <div class="d-flex justify-content-between align-items-center px-4">
				    <!-- Left: Brand -->
				    <a href="homeEmployee" class="navbar-brand text-white mb-0 h1">CRM Application</a>
				    <!-- Right: Admin Info + Logout -->
				    <div class="d-flex align-items-center">
					      <a href="profileEmployee" class="d-flex align-items-center text-white text-decoration-none me-3">
						        <img src="./images/admin_Profile_pic.png" alt="Welcome Admin" style="width:40px;" class="rounded-pill me-2">
						        ${session_employee.getName()}
					      </a>
				      	<a href="logout" class="text-decoration-none text-white">Logout</a>
				    </div>
			  </div>
		</header>
		<!-- Navbar Dropdowns -->
	  <nav class="container-fluid bg-dark py-2 navbar-dark-hover">
	    <div class="d-flex justify-content-center gap-4">
			
	      <!-- Home -->  
	      <a href="homeEmployee" class="nav-link text-white fw-bold px-3 py-2 ">Home</a>
	      <!-- Customer's Enquiry -->
	      <a href="customerEnquiry" class="nav-link text-white fw-bold px-3 py-2 ">Customer's Enquiry</a>
	      <!-- Customer Follow Up  -->
	      <a href="customerFollowUp" class="nav-link text-white fw-bold px-3 py-2 ">Customer Follow Up</a>
	      <!-- Complaints  -->
	      <a href="saleCourse" class="nav-link text-white fw-bold px-3 py-2 ">Sale Course</a>
	      
	    </div>
	  </nav>
</body>
</html>