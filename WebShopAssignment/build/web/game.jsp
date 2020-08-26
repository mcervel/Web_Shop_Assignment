
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.List"%>
<%@ taglib prefix="st" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Game</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link href="resources/styles/main.css" rel="stylesheet" type="text/css"/>
        <link href="resources/fontawesome-free-5.12.0-web/css/fontawesome.min.css" rel="stylesheet" type="text/css"/>
        <c:if test="${empty game}">
            <c:redirect url="/homeScreen"/>
        </c:if>
    </head>
    <body id="gameBody">  
        <div class="contentGame">

            <div id="header">
                <c:import url="WEB-INF/_header.jsp" var="_header"/>
                ${_header}
            </div>

            <div class="container-fluid mainGameDiv mt-5">
                <div class="row">
                    <div class="col-md-3">
                        <img class="img-fluid center-block p-3" src="${game.imgPath}" width="300px" height="400"></img>
                    </div> 
                    <div class="col-md-8">
                        <div class="col-md-12 pt-3 text-center">
                            <h1>${game.gameName}</h1>
                        </div>
                        <div class="col-md-12 mt-5">
                            <h5><b><span class="gameAttribute">Console: </b></span> ${game.console}</h5>
                        </div>
                        <div class="col-md-12">
                            <h5><b><span class="gameAttribute">Genre: </b></span> ${game.genre}</h5>
                        </div>
                        <div class="col-md-12">
                            <h5><b><span class="gameAttribute">Publisher: </b></span> ${game.publisher}</h5>
                        </div>
                        <div class="col-md-12">
                            <h2 class="price">${game.price} KN</h2>
                        </div>
                        <div class="col-md-12">
                            <form action="buy" class="form-horizontal" method="post" role="form">
                                <div class="btn-group" role="group"> 
                                    <button type="button" role="button" class="btn btnCustom" onclick="stepUp();">+</button>
                                    <input type="number" name="amount" id="amount" style="width:50px" value="1"/>
                                    <button type="button" role="button" class="btn btnCustom" onclick="stepDown();">-</button>
                                </div>
                                <input type="hidden" name="idGame" value="${game.idGame}"/>
                                <button class="btn btnCustom" type="submit">BUY</button>   
                            </form>
                        </div>
                        <div class="col-md-12 mt-2">
                            <span class="info">${info}</span> <span class="error">${error}</span>
                        </div>
                    </div>
                </div>
                <div class="row pl-4 pr-2 pt-5">
                    <div class="col-md-12">
                        <p><b><span class="gameAttribute">About the game: </b></span>  ${game.description}</p>
                    </div>
                </div>

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
                                            document.getElementById("amount").stepUp(1);
                                        }

                                        function stepDown() {
                                            if (document.getElementById("amount").value > 0) {
                                                document.getElementById("amount").stepDown(1);
                                            }

                                        }

        </script>
    </body>
</html>
