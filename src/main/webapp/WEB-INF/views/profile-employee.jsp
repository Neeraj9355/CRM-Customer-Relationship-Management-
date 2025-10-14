<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Profile</title>

  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
        rel="stylesheet" crossorigin="anonymous">
  <link rel="stylesheet" href="/css/style.css" type="text/css"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
          crossorigin="anonymous"></script>
</head>
<body>
  <!-- Header -->
  <jsp:include page="header-employee.jsp"/>

  <div class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card shadow-lg border-0 rounded-3">
          <div class="card-header bg-primary text-white text-center">
            <h4 class="mb-0">Employee Profile</h4>
          </div>
          <div class="card-body">
            <div class="text-center mb-3">
              <img src="./images/admin_Profile_pic.png" 
                   class="rounded-circle img-thumbnail" 
                   alt="Profile Picture" 
                   style="height: 100px">
            </div>
            <h5 class="card-title text-center">Hello, ${session_employee.getName()}</h5>
            <div class="mt-4">
              <p class="mb-2"><strong>Email:</strong> ${session_employee.getEmail()}</p>
              <p class="mb-0"><strong>Phone:</strong> ${session_employee.getPhoneNo()}</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
