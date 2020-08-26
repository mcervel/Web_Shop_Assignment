package webshop.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import webshop.beans.Game;
import webshop.bl.Referada;

/**
 *
 * @author Lijeposava
 */
public class GameServlet extends HttpServlet {

    private Referada referada;

    @Override
    public void init() throws ServletException {
        referada = new Referada();
        super.init(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idGameString = request.getParameter("idGame");
        
        int idGame = Integer.parseInt(idGameString);
        Game game = referada.getGame(idGame);
        
        request.setAttribute("game", game);
        request.getRequestDispatcher("game.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
    

}
