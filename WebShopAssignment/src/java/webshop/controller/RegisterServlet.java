/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package webshop.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import webshop.beans.*;
import webshop.bl.Referada;

/**
 *
 * @author Lijeposava
 */
public class RegisterServlet extends HttpServlet {

    private String regexName = "^[a-zA-Z]+$";
    private String regexString = "^[a-zA-Z]+( +[a-zA-Z]+)*$";
    private String regexNumber = "[+-]?[0-9][0-9]*";
    private String regexEmail = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
    private Referada referada;
    private StringBuilder errors;

    @Override
    public void init() throws ServletException {
        referada = new Referada();
        super.init(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("register.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int invalidCounter = 0;
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String street = request.getParameter("street");
        String houseNumber = request.getParameter("houseNumber");
        String postalNumber = request.getParameter("postalNumber");
        String town = request.getParameter("town");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        errors = new StringBuilder();

        if (referada.checkIfUserExists(email)) {
            request.setAttribute("error", "User with that email already exists!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {

            if (!isValidName(firstName)) {
                errors.append("First name is not valid!\n");
                invalidCounter++;
            } else {
                request.setAttribute("firstName", firstName);
            }

            if (!isValidName(lastName)) {
                errors.append("Last name is not valid!\n");
                invalidCounter++;
            } else {
                request.setAttribute("lastName", lastName);
            }

            if (!isValidString(street)) {
                errors.append("Street is not valid!\n");
                invalidCounter++;
            } else {
                request.setAttribute("street", street);
            }

            if (!isValidHouseNumber(houseNumber)) {
                errors.append("House number is not valid!\n");
                invalidCounter++;
            } else {
                request.setAttribute("houseNumber", houseNumber);
            }

            if (!isValidPostalNumber(postalNumber)) {
                errors.append("Postal number is not valid!\n");
                invalidCounter++;
            } else {
                request.setAttribute("postalNumber", postalNumber);
            }

            if (!isValidString(town)) {
                errors.append("Town is not valid!\n");
                invalidCounter++;
            } else {
                request.setAttribute("town", town);
            }

            if (!isValidEmail(email)) {
                errors.append("Email is not valid!\n");
                invalidCounter++;
            } else {
                request.setAttribute("email", email);
            }
            
            if (password.isEmpty()) {
                errors.append("Password is required!\n");
                invalidCounter++;
            }

            if (!confirmPassword.equals(password)) {
                errors.append("Passwords do not match!\n");
                invalidCounter++;
            }

            if (invalidCounter == 0) {
                request.setAttribute("info", "Successfully registered user, please login!");
//                ubaci novog usera u bazu
                int houseNumberInt = Integer.parseInt(houseNumber);
                
                User user = new User();
                user.setEmail(email);
                user.setFirstName(firstName);
                user.setLastName(lastName);
                user.setPassword(password);
                user.setStreet(street);
                user.setTown(town);
                user.setPostalNumber(postalNumber);
                user.setHouseNumber(houseNumberInt);
                
                referada.insertUser(user);
                
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                request.setAttribute("error", errors.toString());
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    public Boolean isValidName(String validationString) {
        if (validationString.matches(regexName) && validationString.length() < 20 && validationString.length() > 0) {
            return true;
        } else {
            return false;
        }
    }

    public Boolean isValidString(String validationString) {
        if (validationString.matches(regexString) && validationString.length() < 30 && validationString.length() > 0) {
            return true;
        } else {
            return false;
        }
    }

    public Boolean isValidHouseNumber(String houseNumber) {
        if (houseNumber.matches(regexNumber) && Integer.parseInt(houseNumber) > 0 && Integer.parseInt(houseNumber) < 500) {
            return true;
        } else {
            return false;
        }
    }

    public Boolean isValidPostalNumber(String postalNumber) {
        if (postalNumber.matches(regexNumber) && Integer.parseInt(postalNumber) > 0 && Integer.parseInt(postalNumber) < 100000) {
            return true;
        } else {
            return false;
        }
    }

    public Boolean isValidEmail(String email) {
        if (email.matches(regexEmail)) {
            return true;
        } else {
            return false;
        }
    }

}
