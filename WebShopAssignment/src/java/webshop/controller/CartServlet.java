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
import webshop.bl.Referada;

/**
 *
 * @author Lijeposava
 */
public class CartServlet extends HttpServlet {

    private Referada referada;

    @Override
    public void init() throws ServletException {
        referada = new Referada();
        super.init(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("cart.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<GameCart> gameCarts = (ArrayList<GameCart>) session.getAttribute("gameCarts");
        List<GameCart> toRemove = new ArrayList<GameCart>();

        if (gameCarts == null) {
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        }

        String actionType = request.getParameter("actionType");
        String idGameGameToChangeString = request.getParameter("idGameToChange");

        int idGameToChange = Integer.parseInt(idGameGameToChangeString);

        if (actionType.equals("stepUp")) {
            for (GameCart gameCart : gameCarts) {

                int amount = gameCart.getAmount();

                if (gameCart.getGame().getIdGame() == idGameToChange) {
                    gameCart.setAmount(amount += 1);
                }
            }
        } else if (actionType.equals("stepDown")) {
            for (GameCart gameCart : gameCarts) {
                if (gameCart.getGame().getIdGame() == idGameToChange) {

                    int amount = gameCart.getAmount();

                    gameCart.setAmount(amount -= 1);
                    if (gameCart.getAmount() <= 0) {
                        toRemove.add(gameCart);
                    }
                }
            }
        } else if (actionType.equals("remove")) {
            for (GameCart gameCart : gameCarts) {
                if (gameCart.getGame().getIdGame() == idGameToChange) {
                    toRemove.add(gameCart);
                }
            }
        }

        gameCarts.removeAll(toRemove);

        if (gameCarts == null) {
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        } else {
            session.setAttribute("gameCarts", gameCarts);
        }

        request.getRequestDispatcher("cart.jsp").forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
