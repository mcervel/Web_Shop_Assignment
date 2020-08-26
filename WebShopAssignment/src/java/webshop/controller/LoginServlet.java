/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package webshop.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import webshop.beans.User;
import webshop.bl.Referada;

/**
 *
 * @author Lijeposava
 */
public class LoginServlet extends HttpServlet {

    private Referada referada;

    @Override
    public void init() throws ServletException {
        referada = new Referada();
        super.init(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = new User();
        user.setEmail(email);
        user.setPassword(password);

        if (referada.validateUser(user)) {
            User currentUser = referada.getUserForEmail(email);
            HttpSession session = request.getSession();
            session.setAttribute("user", currentUser);
            response.sendRedirect("homeScreen");
        } else {
            request.setAttribute("error", "Unsuccessful login, incorrect password or email");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
