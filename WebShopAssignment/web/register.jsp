
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link href="resources/styles/login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="formArea registerForm">
            <div class="col-lg-12 col-md-12 col-sm-12 text-center">
                <h2>Register</h2>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <section id="registerForm">

                        <form action="register" class="form-horizontal" method="post" role="form">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <b>
                                        <label for="firstName" class="col-md-12 col-form-label">First name: </label>
                                    </b>
                                    <div class="col-md-12">
                                        <input type="text" id="firstName" name="firstName" class="form-control textInput" value="${firstName}"></input>
                                    </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <b>
                                        <label for="lastName" class="col-md-12 col-form-label">Last name: </label>
                                    </b>
                                    <div class="col-md-12">
                                        <input type="text" id="lastName" name="lastName" class="form-control textInput" value="${lastName}"></input>
                                    </div>
                                </div>   
                            </div>

                            <div class="col-lg-12 col-md-12 col-sm-12 text-center">
                                <h4>Address</h4>
                                <hr style="margin-top: 3px; background-color: #fdf800;" />
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <b>
                                        <label for="street" class="col-md-12 control-label">Street: </label>
                                    </b>
                                    <div class="col-md-12">
                                        <input type="text" id="street" name="street" class="form-control textInput" value="${street}"></input>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <b>
                                        <label for="houseNumber" class="col-md-12 control-label">House nr: </label>
                                    </b>
                                    <div class="col-md-12">
                                        <input type="text" id="houseNumber" name="houseNumber" class="form-control textInput" value="${houseNumber}"></input>
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <b>
                                        <label for="postalNumber" class="col-md-12 control-label">Postal number: </label>
                                    </b>
                                    <div class="col-md-12">
                                        <input type="text" id="postalNumber" name="postalNumber" class="form-control textInput" value="${postalNumber}"></input>
                                    </div>
                                </div>
                                <div class="form-group col-md-4">
                                    <b>
                                        <label for="town" class="col-md-12 control-label">Town: </label>
                                    </b>
                                    <div class="col-md-12">
                                        <input type="text" id="town" name="town" class="form-control textInput" value="${town}"></input>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-sm-12 text-center">
                                <h4>Login details</h4>
                                <hr style="margin-top: 3px; background-color: #fdf800;" />
                            </div>

                            <div class="form-group">
                                <b>
                                    <label for="email" class="col-md-12 control-label">Email: </label>
                                </b>
                                <div class="col-md-12">
                                    <input type="text" id="email" name="email" class="form-control textInput" value="${email}"></input>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <b>
                                        <label for="password" class="col-md-12 control-label">Password: </label>
                                    </b>
                                    <div class="col-md-12">
                                        <input type="password" id="password" name="password" class="form-control textInput"></input>
                                    </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <b>
                                        <label for="confirmPassword" class="col-md-12 control-label">Confirm password: </label>
                                    </b>
                                    <div class="col-md-12">
                                        <input type="password" id="confirmPassword" name="confirmPassword" class="form-control textInput"></input>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-12">
                                    <input type="submit" value="Register" class="btn btnSubmit btn-block " />
                                </div>
                            </div>
                            <div class="form-group">
                                <span class="error">${error}</span>
                            </div>
                        </form>

                        <p>
                            <a href="login" class="linkButton">Login with existing account</a>
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
