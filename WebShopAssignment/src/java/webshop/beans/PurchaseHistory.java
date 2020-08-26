package webshop.beans;

import java.sql.Timestamp;

/**
 *
 * @author Lijeposava
 */
public class PurchaseHistory {

    private String purchaseMethod;
    private Timestamp purchaseDateTime;
    private int registeredUserId;

    public PurchaseHistory() {
    }

    @Override
    public String toString() {
        return "PurchaseHistory{" + "purchaseMethod=" + purchaseMethod + ", purchaseDateTime=" + purchaseDateTime + ", registeredUserId=" + registeredUserId + '}';
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

    public int getRegisteredUserId() {
        return registeredUserId;
    }

    public void setRegisteredUserId(int registeredUserId) {
        this.registeredUserId = registeredUserId;
    }

}
