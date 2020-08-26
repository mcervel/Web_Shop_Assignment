<%@tag body-content="empty"%>
<%@ attribute name="game" required="true" type="webshop.beans.Game" %>
<%@ attribute name="console" required="true" type="webshop.beans.Console" %>

<div class="col-md-2 p-2 m-2 game text-center">
    <form action="game" class="form-horizontal" method="post" role="form" id="gameForm">
        <a href="#" onclick="$(this).closest('form').submit()" style="text-decoration: none; color: #fdf800;">
            <input type="hidden" name="idGame" value="${game.idGame}"/>
            <div>
                <img class="img-fluid center-block p-3" src="${game.imgPath}" alt="" width="200px" height="250px"></img>
            </div>
            <h4>${game.gameName}</h4>
            <p class="consoleName">${console.consoleName}</p>
            <b class="consolePrice">${game.price},00 KN</b>
        </a>
    </form>
</div>