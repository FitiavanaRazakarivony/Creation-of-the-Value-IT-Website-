package table;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author BRAYAN
 */
import java.sql.*;
import java.util.Vector;
public class teste {
    public static void main(String []args)throws Exception{
    etudiant b = new etudiant(1,"rabe","rasoa");
    
    //manokatra connexion java
    Connection c = connexion.connect();
    
     //b.insert(1,"randria","nantenaina",c);    

    //Vector <etudiant>g=new Vector <etudiant>(); 
     Vector <etudiant>g =b.listeEtudiant(c);
     
     for (int i =0;i<g.size();i++){
         System.out.print (g.get(i).getId());
     }
     
    try {
    // manidy connexion            
        c.close();
    }catch(Exception e){
    
    }

 
    }
}
