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
public class Game {

    private int idGame;
    private String gameName;
    private int price;
    private String imgPath;
    private String genre;
    private String publisher;
    private String console;
    private String description;

    public Game() {
    }

    @Override
    public String toString() {
        return "Game{" + "idGame=" + idGame + ", gameName=" + gameName + ", price=" + price + ", imgPath=" + imgPath + ", genre=" + genre + ", publisher=" + publisher + ", console=" + console + ", description=" + description + '}';
    }

    public String getConsole() {
        return console;
    }

    public void setConsole(String console) {
        this.console = console;
    }

    public int getIdGame() {
        return idGame;
    }

    public void setIdGame(int idGame) {
        this.idGame = idGame;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public String getGameName() {
        return gameName;
    }

    public void setGameName(String gameName) {
        this.gameName = gameName;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

}
