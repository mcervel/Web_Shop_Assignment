/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package webshop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import webshop.beans.Console;
import webshop.beans.Game;
import webshop.bl.Referada;

/**
 *
 * @author Lijeposava
 */
public class Ps4Servlet extends HttpServlet {

    private Referada referada;

    @Override
    public void init() throws ServletException {
        referada = new Referada();
        super.init(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Game> games = referada.getGamesForConsole(4);
        Console console = referada.getConsole(4);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/games.jsp");
        request.setAttribute("console", console);
        request.setAttribute("games", games);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
