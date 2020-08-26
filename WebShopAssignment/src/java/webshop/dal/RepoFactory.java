/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package webshop.dal;

/**
 *
 * @author Lijeposava
 */
public class RepoFactory {
    public static IRepo GetRepo(){
        return new Repository();
    }
}
