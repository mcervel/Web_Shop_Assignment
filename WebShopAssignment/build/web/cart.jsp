
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.List"%>
<%@ taglib prefix="st" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link href="resources/styles/main.css" rel="stylesheet" type="text/css"/>
        <link href="resources/fontawesome-free-5.12.0-web/css/fontawesome.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body id="cart">  
        <div class="contentCart">

            <div id="header">
                <c:import url="WEB-INF/_header.jsp" var="_header"/>
                ${_header}
            </div>

            <div class="container-fluid cartDiv mt-5 pt-3">

                <c:choose>  
                    <c:when test="${empty gameCarts}"> 
                        <div class="row pb-2">
                            <div class="col-md-12">
                                <p>Your cart is currently empty!</p>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>   
                        <div class="row">
                            <div class="col-md-12">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th></th>
                                            <th>Game</th>
                                            <th>Price</th>
                                            <th>Amount</th>
                                            <th>Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <c:forEach items="${gameCarts}" var="gameCart">
                                        <form action="cart" class="form-horizontal" method="post" role="form" id="formSubmit${gameCart.game.idGame}">
                                            <tr>

                                            <td><a type="submit" href="#" class="btn btn-danger" onclick="$('input[id=actionType${gameCart.game.idGame}]').val('remove');$('#formSubmit${gameCart.game.idGame}').submit();">X</a></td>

                                            <td><img class="img-fluid center-block" src="${gameCart.game.imgPath}" width="25px" height="35"></img></td>
                                            <td>${gameCart.game.gameName}</td>
                                            <td>${gameCart.game.price}</td>
                                            <td>
                                                <form action="cart" class="form-horizontal" method="post" role="form">
                                                    <div class="btn-group" role="group"> 
                                                        <input type="hidden" id="actionType${gameCart.game.idGame}" name="actionType" value=""/>
                                                        <input type="hidden" name="idGameToChange" value="${gameCart.game.idGame}"/>
                                                        <a href="#" class="btn btnCustom" onclick="$('input[id=actionType${gameCart.game.idGame}]').val('stepUp');$('#formSubmit${gameCart.game.idGame}').submit();">+</a>
                                                        <input type="number" name="amount" id="amount" style="width:50px" value="${gameCart.amount}"/>
                                                        <a href="#" class="btn btnCustom" onclick="$('input[id=actionType${gameCart.game.idGame}]').val('stepDown');$('#formSubmit${gameCart.game.idGame}').submit();">-</a>
                                                    </div>
                                                    <input type="hidden" name="idGame" value="${game.idGame}"/>
                                                </form>
                                            </td>
                                            <td>${gameCart.game.price * gameCart.amount}</td>
                                            </tr>
                                        </form>
                                    </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="row pb-4">
                            <div class="col-md-12">
                                <a href="payment" class="btn btnCustom">Continue to payment</a>
                            </div>
                            <div class="col-md-12 pt-3">
                                <span class="info">${info}</span>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <c:import url="WEB-INF/_footer.jsp" var="_footer"/>
            ${_footer}

        </div>

        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="https://use.fontawesome.com/765b2df685.js"></script>

        <script>

                                                            function stepUp() {
                                                                document.getElementById("actionType").value = "stepUp";

                                                            }

                                                            function stepDown() {
                                                                document.getElementById("actionType").value = "stepDown";

                                                            }

        </script>


    </body>
</html>
