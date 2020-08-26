
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="st" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link href="resources/styles/main.css" rel="stylesheet" type="text/css"/>
        <link href="resources/fontawesome-free-5.12.0-web/css/fontawesome.min.css" rel="stylesheet" type="text/css"/>
        <%--<c:redirect url="/register.jsp"/>--%>
    </head>
    <body class="main">
        <div id="header">
            <c:import url="WEB-INF/_header.jsp" var="_header"/>
            ${_header}
        </div>

        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-100" style="height:600px;" src="resources/images/home/the-outer-worlds.jpg" alt="First slide">
                </div>
                <div class="carousel-item">
                    <img class="w-100" style="height:600px;" src="resources/images/home/red-dead-redemption-2.png" alt="Second slide">
                </div>
                <div class="carousel-item">
                    <img class="w-100" style="height:600px;" src="resources/images/home/dark-souls-3.jpg" alt="Third slide">
                </div>
                <div class="carousel-item">
                    <img src="resources/images/home/borderlands-3.jpg" class="w-100" style="height:600px;" alt="Fourth slide"/>
                </div>
                <div class="carousel-item">
                    <img src="resources/images/home/star-wars-jedi-fallen-order.jpg" class="w-100" style="height:600px;" alt="Sixth slide"/>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        <c:import url="WEB-INF/_footer.jsp" var="_footer"/>
        ${_footer}

    </div>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="https://use.fontawesome.com/765b2df685.js"></script>

</html>
