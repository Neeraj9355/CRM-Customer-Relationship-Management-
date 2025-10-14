<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Home</title>

  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="/css/style.css" type="text/css"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
</head>
<body>
  <!-- Header -->
  <jsp:include page="header-employee.jsp"/>

  <div class="container mt-3">  
      <h3>Hello : ${session_employee.getName()}</h3>
      <p>Now you can handle the functionalities</p>
  </div>

  <div>
      <canvas id="myChart" style="width:100%;max-width:600px"></canvas>
  </div>

  <script>
      // Prepare chart data from JSP model
      const xValues = [
          <c:forEach items="${model_soldCourses}" var="row" varStatus="status">
              '${row[0]}'<c:if test="${!status.last}">,</c:if>
          </c:forEach>
      ];

      const yValues = [
          <c:forEach items="${model_soldCourses}" var="row" varStatus="status">
              ${row[1]}<c:if test="${!status.last}">,</c:if>
          </c:forEach>
      ];

      new Chart("myChart", {
          type: "line",
          data: {
              labels: xValues,
              datasets: [{
                  fill: false,
                  lineTension: 0,
                  backgroundColor: "rgba(0,0,255,1.0)",
                  borderColor: "rgba(0,0,255,0.5)",
                  data: yValues
              }]
          },
          options: {
              legend: {display: false},
              scales: {
                  yAxes: [{ticks: {beginAtZero:true}}]
              }
          }
      });
  </script>
</body>
</html>
