<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="navbar navbar-expand-md fixed-top" style="padding:30px 30px 30px 30px; background-color: #091833">

    <a href="homeScreen" class="company mb-0 h1">
        Haclymorph
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon">EXPAND</span>
    </button>
    <div class="collapse navbar-collapse justify-content-md-center" id="navbarCollapse">

        <ul class="navbar-nav mr-auto m-auto">
            <li class="nav-item">
                <a class="nav-link" href="pc">PC</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="xbox">| XBOX ONE</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="ps4">| PLAYSTATION 4</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="switch">| SWITCH</a>
            </li>
        </ul>

        <div class="mt-2 mt-md-0">
            <ul class="navbar-nav mr-auto">

                <li class="nav-item">
                    <a class="nav-link" href="cart">
                        <span class="fa fa-shopping-cart"></span>
                    </a>
                </li>

                <c:choose>  
                    <c:when test="${empty user}"> 
                        <li class="nav-item">
                            <a class="nav-link" href="login">Login <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="register">Register</a>
                        </li>
                    </c:when>
                    <c:otherwise>   
                        <li class="nav-item">
                            <a class="nav-link" href="account">
                                <span class="fa fa-user-circle-o"></span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="logout">Logout</a>
                        </li>
                    </c:otherwise>
                </c:choose>

            </ul>
        </div>
    </div>
</nav>
