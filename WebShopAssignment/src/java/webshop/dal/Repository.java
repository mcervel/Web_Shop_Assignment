/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package webshop.dal;

import com.microsoft.sqlserver.jdbc.SQLServerDataSource;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import webshop.beans.*;

/**
 *
 * @author Lijeposava
 */
public class Repository implements IRepo {

    private static DataSource getDataSource() {
        SQLServerDataSource sqlDataSource = new SQLServerDataSource();
        sqlDataSource.setServerName("localhost");
        sqlDataSource.setUser("sa");
        sqlDataSource.setPassword("SQL");
        sqlDataSource.setDatabaseName("Haclymorph");

        return sqlDataSource;
    }

    @Override
    public boolean validateUser(User user) {
        boolean status = false;

        DataSource dataSource = getDataSource();

        try (Connection connection = dataSource.getConnection()) {
            try (PreparedStatement preparedStatement = connection.prepareStatement("select * from RegisteredUser where Email = ? and UserPassword = ? ")) {

                preparedStatement.setString(1, user.getEmail());
                preparedStatement.setString(2, user.getPassword());

                ResultSet rs = preparedStatement.executeQuery();
                status = rs.next();

                preparedStatement.execute();

            } catch (SQLException e) {
                connection.rollback();
                throw e;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    @Override
    public boolean checkIfUserExists(String email) {
        boolean status = false;

        DataSource dataSource = getDataSource();

        try (Connection connection = dataSource.getConnection()) {
            try (PreparedStatement preparedStatement = connection.prepareStatement("select * from RegisteredUser where Email = ?")) {

                preparedStatement.setString(1, email);

                ResultSet rs = preparedStatement.executeQuery();
                status = rs.next();

                preparedStatement.execute();

            } catch (SQLException e) {
                connection.rollback();
                throw new SQLException("Error connecting to database");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    @Override
    public List<Game> getGamesForConsole(int consoleID) {

        DataSource dataSource = getDataSource();
        List<Game> games = new ArrayList<>();

        try (Connection conn = dataSource.getConnection()) {

            try (CallableStatement stmnt = conn.prepareCall("{CALL GetGamesForConsole(?)}")) {

                stmnt.setInt(1, consoleID);

                ResultSet resultSet = stmnt.executeQuery();

                while (resultSet.next()) {
                    Game game = new Game();
                    game.setIdGame(resultSet.getInt("IDGame"));
                    game.setGameName(resultSet.getString("GameName"));
                    game.setPrice(resultSet.getInt("Price"));
                    game.setImgPath(resultSet.getString("ImgPath"));

                    games.add(game);
                }

                stmnt.execute();

            } catch (Exception e) {
                conn.rollback();
                System.out.println("Promjene odbacene zbog greske: " + e.getMessage());
            }
        } catch (SQLException e) {
            System.out.println("Promjene odbacene zbog greske: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Promjene odbacene zbog greske: " + e.getMessage());
        }
        return games;
    }

    @Override
    public Console getConsole(int consoleID) {
        DataSource dataSource = getDataSource();
        Console console = new Console();

        try (Connection conn = dataSource.getConnection()) {

            try (CallableStatement stmnt = conn.prepareCall("{CALL GetConsole(?)}")) {

                stmnt.setInt(1, consoleID);

                ResultSet resultSet = stmnt.executeQuery();

                while (resultSet.next()) {
                    console.setConsoleName(resultSet.getString("ConsoleName"));
                    console.setIdConsole(resultSet.getInt("IDConsole"));
                }

                stmnt.execute();

            } catch (Exception e) {
                conn.rollback();
                System.out.println("Promjene odbacene zbog greske: " + e.getMessage());
            }
        } catch (SQLException e) {
            System.out.println("Promjene odbacene zbog greske: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Promjene odbacene zbog greske: " + e.getMessage());
        }
        return console;
    }

    @Override
    public User getUserForEmail(String email) {
        DataSource dataSource = getDataSource();
        User user = new User();

        try (Connection conn = dataSource.getConnection()) {

            try (CallableStatement stmnt = conn.prepareCall("{CALL GetUserForEmail(?)}")) {

                stmnt.setString(1, email);

                ResultSet resultSet = stmnt.executeQuery();

                while (resultSet.next()) {
                    user.setIDUser(resultSet.getInt("IDUser"));
                    user.setEmail(resultSet.getString("Email"));
                    user.setIsAdmin(resultSet.getBoolean("IsAdmin"));
                    user.setFirstName(resultSet.getString("FirstName"));
                    user.setLastName(resultSet.getString("LastName"));
                    user.setStreet(resultSet.getString("StreetName"));
                    user.setPostalNumber(resultSet.getString("PostalNumber"));
                    user.setHouseNumber(resultSet.getInt("HouseNumber"));
                    user.setTown(resultSet.getString("TownName"));
                }

                stmnt.execute();

            } catch (Exception e) {
                conn.rollback();
                System.out.println("Promjene odbacene zbog greske: " + e.getMessage());
            }
        } catch (SQLException e) {
            System.out.println("Promjene odbacene zbog greske: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Promjene odbacene zbog greske: " + e.getMessage());
        }
        return user;
    }

    @Override
    public Game getGame(int idGame) {
        DataSource dataSource = getDataSource();
        Game game = new Game();

        try (Connection conn = dataSource.getConnection()) {

            try (CallableStatement stmnt = conn.prepareCall("{CALL GetGameForId(?)}")) {

                stmnt.setInt(1, idGame);

                ResultSet resultSet = stmnt.executeQuery();

                while (resultSet.next()) {

                    game.setIdGame(idGame);
                    game.setGameName(resultSet.getString("GameName"));
                    game.setPrice(resultSet.getInt("Price"));
                    game.setImgPath(resultSet.getString("ImgPath"));
                    game.setConsole(resultSet.getString("ConsoleName"));
                    game.setPublisher(resultSet.getString("PublisherName"));
                    game.setGenre(resultSet.getString("GenreName"));
                    game.setDescription(resultSet.getString("GameDescription"));
                }

                stmnt.execute();

            } catch (Exception e) {
                conn.rollback();
                System.out.println("Promjene odbacene zbog greske: " + e.getMessage());
            }
        } catch (SQLException e) {
            System.out.println("Promjene odbacene zbog greske: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Promjene odbacene zbog greske: " + e.getMessage());
        }
        return game;
    }

    @Override
    public void insertUser(User user) {
        DataSource dataSource = getDataSource();

        try (Connection conn = dataSource.getConnection()) {
            try (CallableStatement stmnt = conn.prepareCall("{CALL InsertUser(?,?,?,?,?,?,?,?)}")) {

                stmnt.setString(1, user.getFirstName());
                stmnt.setString(2, user.getLastName());
                stmnt.setString(3, user.getStreet());
                stmnt.setInt(4, user.getHouseNumber());
                stmnt.setString(5, user.getPostalNumber());
                stmnt.setString(6, user.getTown());
                stmnt.setString(7, user.getEmail());
                stmnt.setString(8, user.getPassword());

                stmnt.executeUpdate();

            } catch (SQLException e) {
                conn.rollback();
                throw e;
            }

        } catch (SQLException e) {
            System.out.println("Promjene odbacene zbog greske: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Promjene odbacene zbog greske: " + e.getMessage());
        }
    }

    @Override
    public int insertPurchase(PurchaseHistory purchase) {
        DataSource dataSource = getDataSource();
        int purchaseId = 1;

        try (Connection conn = dataSource.getConnection()) {
            try (CallableStatement stmnt = conn.prepareCall("{CALL InsertPurchase(?,?,?)}")) {

                stmnt.setString(1, purchase.getPurchaseMethod());
                stmnt.setInt(2, purchase.getRegisteredUserId());
                stmnt.registerOutParameter(3, Types.INTEGER);

                stmnt.execute();

                purchaseId = stmnt.getInt(3);

            } catch (SQLException e) {
                conn.rollback();
                throw e;
            }

        } catch (SQLException e) {
            System.out.println("Promjene odbacene zbog greske: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Promjene odbacene zbog greske: " + e.getMessage());
        }

        return purchaseId;
    }

    @Override
    public void insertPurchaseGame(PurchaseGame purchaseGame) {
        DataSource dataSource = getDataSource();

        try (Connection conn = dataSource.getConnection()) {
            try (CallableStatement stmnt = conn.prepareCall("{CALL InsertPurchaseGame(?,?,?)}")) {

                stmnt.setInt(1, purchaseGame.getPurchaseHistoryId());
                stmnt.setInt(2, purchaseGame.getGameId());
                stmnt.setInt(3, purchaseGame.getAmount());

                stmnt.executeUpdate();

            } catch (SQLException e) {
                conn.rollback();
                throw e;
            }

        } catch (SQLException e) {
            System.out.println("Promjene odbacene zbog greske: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Promjene odbacene zbog greske: " + e.getMessage());
        }
    }

    @Override
    public List<RowForPurchaseHistoryTable> getCompletePurchaseHistoryTableRows() {
        DataSource dataSource = getDataSource();
        List<RowForPurchaseHistoryTable> completePurchaseHistoryTableRows = new ArrayList<>();

        try (Connection conn = dataSource.getConnection()) {

            try (CallableStatement stmnt = conn.prepareCall("{CALL GetCompletePurchaseHistoryTableRows}")) {

                ResultSet resultSet = stmnt.executeQuery();

                while (resultSet.next()) {
                    RowForPurchaseHistoryTable purchaseHistoryTableRow = new RowForPurchaseHistoryTable();
                    purchaseHistoryTableRow.setPurchaseDateTime(resultSet.getTimestamp("PurchaseDateTime"));
                    purchaseHistoryTableRow.setPurchaseMethod(resultSet.getString("PurchaseMethod"));
                    purchaseHistoryTableRow.setAmount(resultSet.getInt("Amount"));
                    purchaseHistoryTableRow.setGame(resultSet.getString("GameName"));
                    purchaseHistoryTableRow.setUserFirstName(resultSet.getString("FirstName"));
                    purchaseHistoryTableRow.setUserLastName(resultSet.getString("LastName"));
                    purchaseHistoryTableRow.setUserId(resultSet.getInt("IDUser"));

                    completePurchaseHistoryTableRows.add(purchaseHistoryTableRow);
                }

                stmnt.execute();

            } catch (Exception e) {
                conn.rollback();
                System.out.println("Promjene odbacene zbog greske: " + e.getMessage());
            }
        } catch (SQLException e) {
            System.out.println("Promjene odbacene zbog greske: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Promjene odbacene zbog greske: " + e.getMessage());
        }
        return completePurchaseHistoryTableRows;
    }

    @Override
    public List<RowForPurchaseHistoryTable> getPurchaseHistoryTableRowsForUser(int userId) {
        DataSource dataSource = getDataSource();
        List<RowForPurchaseHistoryTable> purchaseHistoryTableRowsForUser = new ArrayList<>();

        try (Connection conn = dataSource.getConnection()) {

            try (CallableStatement stmnt = conn.prepareCall("{CALL GetPurchaseHistoryTableRowsForUser(?)}")) {

                stmnt.setInt(1, userId);

                ResultSet resultSet = stmnt.executeQuery();

                while (resultSet.next()) {
                    RowForPurchaseHistoryTable purchaseHistoryTableRow = new RowForPurchaseHistoryTable();
                    purchaseHistoryTableRow.setPurchaseDateTime(resultSet.getTimestamp("PurchaseDateTime"));
                    purchaseHistoryTableRow.setPurchaseMethod(resultSet.getString("PurchaseMethod"));
                    purchaseHistoryTableRow.setAmount(resultSet.getInt("Amount"));
                    purchaseHistoryTableRow.setGame(resultSet.getString("GameName"));
                    purchaseHistoryTableRow.setUserFirstName(resultSet.getString("FirstName"));
                    purchaseHistoryTableRow.setUserLastName(resultSet.getString("LastName"));
                    purchaseHistoryTableRow.setUserId(resultSet.getInt("IDUser"));

                    purchaseHistoryTableRowsForUser.add(purchaseHistoryTableRow);
                }

                stmnt.execute();

            } catch (Exception e) {
                conn.rollback();
                System.out.println("Promjene odbacene zbog greske: " + e.getMessage());
            }
        } catch (SQLException e) {
            System.out.println("Promjene odbacene zbog greske: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Promjene odbacene zbog greske: " + e.getMessage());
        }
        return purchaseHistoryTableRowsForUser;
    }

}
