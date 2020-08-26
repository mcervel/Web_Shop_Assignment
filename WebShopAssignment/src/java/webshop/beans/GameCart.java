package webshop.beans;

/**
 *
 * @author Lijeposava
 */
public class GameCart {

    private Game game;
    private int amount;

    public GameCart() {
    }

    public Game getGame() {
        return game;
    }

    public void setGame(Game game) {
        this.game = game;
    }
    
    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

}
