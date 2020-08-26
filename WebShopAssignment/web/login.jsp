<%-- 
    Document   : login
    Created on : 12-Jan-2020, 00:38:09
    Author     : Lijeposava
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log in</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link href="resources/styles/login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="formArea loginForm">
            <div class="col-lg-12 col-md-12 col-sm-12 text-center">
                <h2>Login</h2>
                <hr style="margin-top: 5px" />
            </div>
            <div class="row">
                <div class="col-md-12">
                    <section id="loginForm">

                        <form action="login" class="form-horizontal" method="post" role="form">
                            <div class="form-group">
                                <b>
                                    <label for="email" class="col-md-4 control-label">Email: </label>
                                </b>
                                <div class="col-md-12">
                                    <input type="text" id="email" name="email" class="form-control textInput"></input>
                                </div>
                            </div>
                            <div class="form-group">
                                <b>
                                    <label for="password" class="col-md-4 control-label">Password: </label>
                                </b>
                                <div class="col-md-12">
                                    <input type="password" id="password" name="password" class="form-control textInput"></input>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-12">            
                                    <input type="submit" value="Log in" class="btn btnSubmit btn-block " />
                                </div>
                            </div>
                            <div class="form-group">
                                <span class="error">${error}</span>
                                <span class="info">${info}</span>
                            </div>
                        </form>

                        <p>
                            <a href="register" class="linkButton">Register as a new user</a>
                        </p>
                        <p>
                            <a href="homeScreen" class="linkButton">Back to home screen</a>
                        </p>

                    </section>
                </div>

            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    </body>
</html>
