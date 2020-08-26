package webshop.beans;

import java.sql.Timestamp;

/**
 *
 * @author Lijeposava
 */
public class RowForPurchaseHistoryTable {

    private String purchaseMethod;
    private Timestamp purchaseDateTime;
    private String game;
    private int amount;
    private String userFirstName;
    private String userLastName;
    private int userId;

    public RowForPurchaseHistoryTable() {
    }

    @Override
    public String toString() {
        return "RowForPurchaseHistoryTable{" + "purchaseMethod=" + purchaseMethod + ", purchaseDateTime=" + purchaseDateTime + ", game=" + game + ", amount=" + amount + '}';
    }

    public String getUserFirstName() {
        return userFirstName;
    }

    public void setUserFirstName(String userFirstName) {
        this.userFirstName = userFirstName;
    }

    public String getUserLastName() {
        return userLastName;
    }

    public void setUserLastName(String userLastName) {
        this.userLastName = userLastName;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getPurchaseMethod() {
        return purchaseMethod;
    }

    public void setPurchaseMethod(String purchaseMethod) {
        this.purchaseMethod = purchaseMethod;
    }

    public Timestamp getPurchaseDateTime() {
        return purchaseDateTime;
    }

    public void setPurchaseDateTime(Timestamp purchaseDateTime) {
        this.purchaseDateTime = purchaseDateTime;
    }

    public String getGame() {
        return game;
    }

    public void setGame(String game) {
        this.game = game;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

}
