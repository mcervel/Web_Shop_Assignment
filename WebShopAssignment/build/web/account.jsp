
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.List"%>
<%@ taglib prefix="st" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account panel</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link href="resources/styles/main.css" rel="stylesheet" type="text/css"/>
        <link href="resources/fontawesome-free-5.12.0-web/css/fontawesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="resources/DataTables/css/dataTables.bootstrap.css" rel="stylesheet" type="text/css"/>
        <c:if test="${empty accountScreen}">
            <c:redirect url="/homeScreen"/>
        </c:if>
    </head>
    <body id="cart">  
        <div class="contentCart">

            <div id="header">
                <c:import url="WEB-INF/_header.jsp" var="_header"/>
                ${_header}
            </div>

            <div class="container-fluid cartDiv mt-5 pt-3">

                <div class="row">
                    <div class="col-md-12 text-center pb-4">
                        <h2>Purchase history</h2>
                    </div>
                </div>

                <c:choose>  
                    <c:when test="${empty purchaseHistoryTableRows}"> 
                        <div class="row pb-2">
                            <div class="col-md-12">
                                <p>You have no prior purchases!</p>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>   
                        <div class="row">
                            <div class="col-md-12">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>User ID</th>
                                            <th>User first name and last name</th>
                                            <th>Purchase date</th>
                                            <th>Game</th>
                                            <th>Amount</th>
                                            <th>Purchase method</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <c:forEach items="${purchaseHistoryTableRows}" var="purchaseHistoryTableRow">
                                            <tr>
                                                <td>${purchaseHistoryTableRow.userId}</td>
                                                <td>${purchaseHistoryTableRow.userFirstName} ${purchaseHistoryTableRow.userLastName}</td>
                                                <td>${purchaseHistoryTableRow.purchaseDateTime}</td>
                                                <td>${purchaseHistoryTableRow.game}</td>
                                                <td>X${purchaseHistoryTableRow.amount}</td>
                                                <td>${purchaseHistoryTableRow.purchaseMethod}</td>
                                            </tr>
                                        </c:forEach>

                                    </tbody>
                                </table>
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
        <script src="resources/scripts/DataTables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="resources/scripts/DataTables/dataTables.bootstrap.js" type="text/javascript"></script>

        <script>
            $("table.table").DataTable();
        </script>


    </body>
</html>
