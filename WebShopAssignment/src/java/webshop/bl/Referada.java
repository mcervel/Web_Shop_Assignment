/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package webshop.bl;

import java.util.List;
import webshop.beans.*;
import webshop.dal.IRepo;
import webshop.dal.RepoFactory;

/**
 *
 * @author Lijeposava
 */
public class Referada {
    
    private IRepo repo;
    
    public boolean validateUser(User user){
        repo = RepoFactory.GetRepo();
        return repo.validateUser(user);        
    }
    
    public boolean checkIfUserExists(String email){
        repo = RepoFactory.GetRepo();
        return repo.checkIfUserExists(email);        
    }
    
    public List<Game> getGamesForConsole(int consoleID){
        repo = RepoFactory.GetRepo();
        return repo.getGamesForConsole(consoleID);
    }
    
    public Console getConsole(int consoleID){
        repo = RepoFactory.GetRepo();
        return repo.getConsole(consoleID);
    }
    
    public User getUserForEmail(String email){
        repo = RepoFactory.GetRepo();
        return repo.getUserForEmail(email);
    }
    
    public Game getGame(int idGame){
        repo = RepoFactory.GetRepo();
        return repo.getGame(idGame);
    }
    
    public void insertUser(User user){
        repo = RepoFactory.GetRepo();
        repo.insertUser(user);       
    }
    
    public int insertPurchase(PurchaseHistory purchase){
        repo = RepoFactory.GetRepo();
        return repo.insertPurchase(purchase);
    }
    
    public void insertPurchaseGame(PurchaseGame purchaseGame){
        repo = RepoFactory.GetRepo();
        repo.insertPurchaseGame(purchaseGame);
    }
    
    public List<RowForPurchaseHistoryTable> getCompletePurchaseHistoryTableRows(){
        repo = RepoFactory.GetRepo();
        return repo.getCompletePurchaseHistoryTableRows();
    }

    public List<RowForPurchaseHistoryTable> getPurchaseHistoryTableRowsForUser(int userId){
        repo = RepoFactory.GetRepo();
        return repo.getPurchaseHistoryTableRowsForUser(userId);
    }
}
