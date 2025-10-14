<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About | Customer Relationship Management</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Custom CSS -->
    <link rel="stylesheet" href="/css/style.css" type="text/css"/>
</head>
<body>
    <!-- Header Include -->
    <jsp:include page="header-crm.jsp"/>

    <div class="container my-5">
        <div class="text-center mb-5">
            <h2 class="fw-bold text-primary">About Our CRM System</h2>
            <p class="text-muted">Empowering businesses to manage customer relationships effectively.</p>
        </div>

        <div class="row align-items-center">
            <div class="col-md-6 mb-4">
                <img src="/images/about_crm.png" alt="CRM Dashboard" class="img-fluid rounded shadow-sm">
            </div>
            <div class="col-md-6">
                <h4 class="fw-semibold mb-3">What is Our CRM?</h4>
                <p class="text-muted">
                    Our Customer Relationship Management (CRM) platform is designed to help organizations streamline
                    their interactions with customers, improve communication, and increase overall productivity.
                </p>
                <p class="text-muted">
                    From tracking enquiries and managing leads to maintaining follow-ups and visualizing data insights — 
                    our CRM simplifies the workflow for sales, marketing, and support teams.
                </p>
            </div>
        </div>

        <hr class="my-5">

        <div class="row text-center">
            <div class="col-md-4 mb-4">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-body">
                        <h5 class="text-primary fw-semibold mb-2">💬 Manage Enquiries</h5>
                        <p class="text-muted mb-0">Track every customer enquiry efficiently and maintain complete communication history.</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-body">
                        <h5 class="text-primary fw-semibold mb-2">📊 Smart Analytics</h5>
                        <p class="text-muted mb-0">Visualize data and make informed decisions with intuitive reports and dashboards.</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-body">
                        <h5 class="text-primary fw-semibold mb-2">🤝 Customer Engagement</h5>
                        <p class="text-muted mb-0">Strengthen relationships with timely follow-ups and personalized customer experiences.</p>
                    </div>
                </div>
            </div>
        </div>

        <hr class="my-5">

        <div class="text-center">
            <h4 class="fw-bold text-dark mb-3">Our Mission</h4>
            <p class="text-muted mx-auto" style="max-width: 700px;">
                To simplify customer relationship management for every organization by providing a
                user-friendly, efficient, and scalable solution — enabling businesses to grow stronger connections
                with their customers and make data-driven decisions.
            </p>
        </div>
    </div>

    <!-- Footer (Optional) -->
    <footer class="bg-dark text-light py-3 text-center">
        <p class="mb-0">&copy; ${pageContext.request.serverName} - CRM System | All Rights Reserved.</p>
    </footer>
</body>
</html>
