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
public class BuyServlet extends HttpServlet {

    private String regexNumber = "[+-]?[0-9][0-9]*";
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

        String amountString = request.getParameter("amount");

        if (!isValidAmount(amountString)) {

            request.setAttribute("game", game);

            request.setAttribute("error", "Please enter a valid amount.");
            request.getRequestDispatcher("game.jsp").forward(request, response);
        } else {
            int amount = Integer.parseInt(amountString);

            GameCart gameCart = new GameCart();
            gameCart.setAmount(amount);
            gameCart.setGame(game);

            boolean exists = false;

            HttpSession session = request.getSession();
            List<GameCart> gameCarts = (List<GameCart>) session.getAttribute("gameCarts");
            List<GameCart> gameCartsToAdd = new ArrayList<>();

            if (gameCarts == null) {
                gameCarts = new ArrayList<GameCart>();
            }

            if (gameCarts.size() > 0) {

                for (GameCart gameCartFor : gameCarts) {
                    if (gameCartFor.getGame().getIdGame() == gameCart.getGame().getIdGame()) {
                        int gameCartNewAmount = gameCartFor.getAmount();
                        gameCartNewAmount += gameCart.getAmount();
                        gameCartFor.setAmount(gameCartNewAmount);
                        exists = true;
                        break;
                    }
                }
                
                if (!exists) {
                    gameCartsToAdd.add(gameCart);
                }

            } else {
                gameCartsToAdd.add(gameCart);
            }

            gameCarts.addAll(gameCartsToAdd);

            session.setAttribute("gameCarts", gameCarts);

            request.setAttribute("game", game);
            request.setAttribute("info", "Items have been successfully added to your cart!");
            request.getRequestDispatcher("game.jsp").forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    public Boolean isValidAmount(String amount) {
        if (!amount.isEmpty() && amount.matches(regexNumber) && Integer.parseInt(amount) > 0 && Integer.parseInt(amount) < 500) {
            return true;
        } else {
            return false;
        }
    }

}
