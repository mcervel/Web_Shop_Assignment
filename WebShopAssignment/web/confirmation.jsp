
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmation</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link href="resources/styles/main.css" rel="stylesheet" type="text/css"/>
        <link href="resources/fontawesome-free-5.12.0-web/css/fontawesome.min.css" rel="stylesheet" type="text/css"/>
        <c:if test="${empty confirmation}">
            <c:redirect url="/homeScreen"/>
        </c:if>
    </head>
    <body id="cart">  
        <div class="contentPayment">

            <div id="header">
                <c:import url="WEB-INF/_header.jsp" var="_header"/>
                ${_header}
            </div>
            <form action="confirmation" class="form-horizontal" method="post" role="form" id="formSubmit">
                <div class="container-fluid paymentDiv mt-5 pt-3">
                    <div class="row pb-2">
                        <div class="col-md-12 text-center">
                            <h2>CONFIRMATION</h2>
                        </div>
                        <div class="col-md-12 pt-3 pb-3">
                            Thank you for your purchase! Your order will arrive within 5-7 business days. We hope you shop with us again :)
                        </div>  
                    </div>
                </div>
            </form>
            <c:import url="WEB-INF/_footer.jsp" var="_footer"/>
            ${_footer}

        </div>

        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="https://use.fontawesome.com/765b2df685.js"></script>

    </body>
</html>