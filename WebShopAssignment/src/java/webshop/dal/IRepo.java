/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package webshop.dal;

import java.util.List;
import webshop.beans.*;

/**
 *
 * @author Lijeposava
 */
public interface IRepo {
    boolean validateUser(User user);
    boolean checkIfUserExists(String email);
    List<Game> getGamesForConsole(int consoleID);
    Console getConsole(int consoleID);
    User getUserForEmail(String email);
    Game getGame(int idGame);
    void insertUser(User user);
    int insertPurchase(PurchaseHistory purchase);
    void insertPurchaseGame(PurchaseGame purchaseGame);
    List<RowForPurchaseHistoryTable> getCompletePurchaseHistoryTableRows();
    List<RowForPurchaseHistoryTable> getPurchaseHistoryTableRowsForUser(int userId);
    
}
