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
public class AccountServlet extends HttpServlet {

    private Referada referada;

    @Override
    public void init() throws ServletException {
        referada = new Referada();
        super.init(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");
        
        List<RowForPurchaseHistoryTable> purchaseHistoryTableRows = new ArrayList<>();
        
        if (currentUser.isIsAdmin()) {
            purchaseHistoryTableRows = referada.getCompletePurchaseHistoryTableRows();
        }else{
            purchaseHistoryTableRows = referada.getPurchaseHistoryTableRowsForUser(currentUser.getIDUser());
        }
        
        request.setAttribute("purchaseHistoryTableRows", purchaseHistoryTableRows);
        request.setAttribute("accountScreen", "An attribute to check if I'm acessing this jsp from the servlet.");
        request.getRequestDispatcher("account.jsp").forward(request, response);
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
