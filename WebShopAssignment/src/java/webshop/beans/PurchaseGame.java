/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package webshop.beans;

/**
 *
 * @author Lijeposava
 */
public class PurchaseGame {

    private int purchaseHistoryId;
    private int gameId;
    private int amount;

    @Override
    public String toString() {
        return "PurchaseGame{" + "purchaseHistoryId=" + purchaseHistoryId + ", gameId=" + gameId + ", amount=" + amount + '}';
    }

    public PurchaseGame() {
    }

    public int getPurchaseHistoryId() {
        return purchaseHistoryId;
    }

    public void setPurchaseHistoryId(int purchaseHistoryId) {
        this.purchaseHistoryId = purchaseHistoryId;
    }

    public int getGameId() {
        return gameId;
    }

    public void setGameId(int gameId) {
        this.gameId = gameId;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

}
