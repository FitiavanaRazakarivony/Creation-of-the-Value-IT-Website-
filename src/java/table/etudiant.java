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

public class etudiant {
    int id;
    String nom;
    String prenom;
    
    public etudiant(int id, String nom, String prenom){
    this.id = id;
    this.nom = nom;
    this.prenom = prenom;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }
    
    public void insert(int id, String nom, String prenom, Connection c)throws Exception{
        String a = "insert into etudiant values("+id+",'"+nom+"','"+prenom+"')";
        System.out.print(a);
                
       //execute
       Statement s = c.createStatement();
       s.executeUpdate(a);
    }
    
    // liste etudiant
    
    public Vector <etudiant> listeEtudiant(Connection c)throws Exception{
        String n="select * from etudiant";
        
        // anasina an le etudiant
        Vector <etudiant> tab = new Vector <etudiant>();
        
        Statement m = c.createStatement();
        
        //anasina le valiny le requet
        ResultSet res = m.executeQuery(n);
        
        while (res.next())//teteziny par ligne des donnés
        {
            
            //naka le etudiant
            etudiant e = new etudiant(res.getInt("id"),
                    res.getString("nom"),res.getString("prenom"));
                    tab.add(e);
        }
        return tab;
    }
   
}



