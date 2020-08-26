package webshop.controller;

import java.io.IOException;
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
public class ConfirmationServlet extends HttpServlet {

    private Referada referada;

    @Override
    public void init() throws ServletException {
        referada = new Referada();
        super.init(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("homeScreen");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String paymentMethod = request.getParameter("paymentMethod");
        User currentUser = (User) session.getAttribute("user");
        PurchaseHistory purchase = new PurchaseHistory();
        purchase.setPurchaseMethod(paymentMethod);
        purchase.setRegisteredUserId(currentUser.getIDUser());
        int purchaseId = referada.insertPurchase(purchase);

        List<GameCart> gameCarts = (List<GameCart>) session.getAttribute("gameCarts");

        for (GameCart gameCart : gameCarts) {
            PurchaseGame purchaseGame = new PurchaseGame();
            purchaseGame.setAmount(gameCart.getAmount());
            purchaseGame.setGameId(gameCart.getGame().getIdGame());
            purchaseGame.setPurchaseHistoryId(purchaseId);
            referada.insertPurchaseGame(purchaseGame);
        }

        session.removeAttribute("gameCarts");

        request.setAttribute("confirmation", "An attribute to check if I'm acessing this jsp from the servlet.");
        request.getRequestDispatcher("confirmation.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
