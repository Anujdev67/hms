<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>HMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
    <div class="container-fluid">
        <nav class="navbar navbar-light bg-light mb-4">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">HMS</a>
            </div>
        </nav>
        <div class="row mt-4">
            <div class="col-sm-3"></div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        LOGIN
                    </div>
                    <div class="card-body">
                        <form method="post" action="/login-form">
                            <% if(request.getAttribute("msg") != null) { %>
                                <div class="alert alert-warning">
                                    <%= request.getAttribute("msg") %>
                                </div>
                            <% } %>
                            <div class="form-group row">
                                <label for="username" class="col-sm-2 col-form-label">Username</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="username" name="username" placeholder="Username" required>
                                </div>
                            </div>
                            <div class="form-group row mt-2">
                                <label for="password" class="col-sm-2 col-form-label">Password</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                                </div>
                            </div>
                            <div class="form-check mt-2">
                                <input class="form-check-input" type="checkbox" id="rememberMe" name="rememberMe">
                                <label class="form-check-label" for="rememberMe">
                                    Remember Me
                                </label>
                            </div>
                            <input type="submit" value="LOGIN" class="btn btn-primary mt-3">
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-sm-3"></div>
        </div>
    </div>
</body>
</html>
