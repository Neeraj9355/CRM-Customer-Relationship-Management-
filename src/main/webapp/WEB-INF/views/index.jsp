<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Home</title>
  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="css/style.css" type="text/css"/>
</head>
<body>
    <div class="container-fluid p-0 m-0">
        <!--- Header --->
        <jsp:include page="header-crm.jsp"/>
        <!--- Main --->
        <div class="container-fluid p-0 m-0">
            <div class="row main-page-banner p-0 m-0">
                <div class="col-8" style="padding: 70px;">
                    <span class="crm-page-title">CRM Application empowers a global network of over 250,000 businesses in 180 countries to convert more leads,engage with customers,and grow their revenue.</span>
                </div>
                <div class="col-4 crm-logo">
                    <img  src="images/crm_logo.png" height="230"/>
                </div>
            </div>
        </div>
        <div class="container-fluid p-0 m-0">
            <div class="row p-5">
                <div class="col-6">
                    <h3>What does CRM do?</h3>
                    <ul>
                        <li>Track and manage leads, prospects, and customers.</li>
                        <li>Automate follow-ups and reminders.</li>
                        <li>Monitor sales pipelines and customer journeys.</li>
                        <li>Collaborate across departments with shared data.</li>
                        <li>Improve customer service and response times.</li>
                    </ul>
                </div>
                <div class="col-6">
                    <h3>why CRM is essential?</h3>
                    <ul>
                        <li>Boosts productivity by automating routine tasks.</li>
                        <li>Increases sales by streamlining lead management.</li>
                        <li>Enhances customer satisfaction through better communication.</li>
                        <li>Improves decision-making with real-time insights and reports.</li>
                        <li>Scales with your business as your customer base grows.</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body>
</html>