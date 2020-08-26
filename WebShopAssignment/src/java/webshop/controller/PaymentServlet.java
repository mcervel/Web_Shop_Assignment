package webshop.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import webshop.beans.*;

/**
 *
 * @author Lijeposava
 */
public class PaymentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            request.setAttribute("info", "Please login to continue with your purchase!");
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        } else {
            List<GameCart> gameCarts = (ArrayList<GameCart>) session.getAttribute("gameCarts");
            
            int totalPrice = 0;
            
            for (GameCart gameCart : gameCarts) {
                totalPrice += (gameCart.getGame().getPrice() * gameCart.getAmount());
            }
            
            request.setAttribute("totalPrice", totalPrice);
            request.setAttribute("payment", "An attribute to check if I'm acessing this jsp from the servlet.");
            request.getRequestDispatcher("payment.jsp").forward(request, response);
        }

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
