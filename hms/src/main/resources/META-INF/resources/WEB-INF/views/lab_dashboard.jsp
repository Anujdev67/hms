<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
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
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        Lab Dashboard
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Add New Test</h5>
                        <form method="post" action="/add-test">
                            <div class="form-group">
                                <label for="type">Type</label>
                                <input type="text" class="form-control" id="type" name="type" required>
                            </div>
                            <div class="form-group">
                                <label for="description">Description</label>
                                <input type="text" class="form-control" id="description" name="description" required>
                            </div>
                            <button type="submit" class="btn btn-primary mt-3">Add Test</button>
                        </form>
                        <hr>
                        <h5 class="card-title">Tests and Scans</h5>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Type</th>
                                    <th>Description</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                    List<TestAndScans> tests = (List<TestAndScans>) request.getAttribute("listTests");
                                    if (tests != null) {
                                        for (TestAndScans test : tests) {
                                %>
                                <tr>
                                    <td><%= test.getType() %></td>
                                    <td><%= test.getDescription() %></td>
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
