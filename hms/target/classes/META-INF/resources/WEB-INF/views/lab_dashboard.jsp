<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="com.spring.hms.model.Lab" %>
<%@ page import="com.spring.hms.model.TestAndScans" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lab Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
    <div class="container-fluid">
        <nav class="navbar navbar-light bg-light mb-4">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">HMS - Lab Dashboard</a>
            </div>
        </nav>
        <div class="row mt-4">
            <div class="col-sm-3"></div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        Add New Test
                    </div>
                    <div class="card-body">
                        <form method="post" action="/add-test">
                            <div class="form-group row">
                                <label for="test_name" class="col-sm-2 col-form-label">Test Name</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="test_name" name="test_name" placeholder="Test Name" required>
                                </div>
                            </div>
                            <div class="form-group row mt-2">
                                <label for="description" class="col-sm-2 col-form-label">Description</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="description" name="description" placeholder="Description" required>
                                </div>
                            </div>
                            <input type="submit" value="Add Test" class="btn btn-primary mt-3">
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-sm-3"></div>
        </div>

        <div class="row mt-4">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        Test and Scans
                    </div>
                    <div class="card-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Test Name</th>
                                    <th>Description</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                    List<TestAndScans> tests = (List<TestAndScans>) request.getAttribute("listTests");
                                    if (tests != null) {
                                        for (TestAndScans test : tests) {
                                %>
                                <tr>
                                    <td><%= test.getTestName() %></td>
                                    <td><%= test.getDescription() %></td>
                                    <td><%= test.getStatus() %></td>
                                    <td>
                                        <a href="/soft-delete-test?id=<%= test.getId() %>" class="btn btn-warning btn-sm">Soft Delete</a>
                                        <a href="/delete-test?id=<%= test.getId() %>" class="btn btn-danger btn-sm">Delete</a>
                                    </td>
                                </tr>
                                <% 
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
