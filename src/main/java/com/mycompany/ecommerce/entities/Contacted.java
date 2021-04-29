package com.mycompany.ecommerce.entities;

import javax.persistence.*;

@Entity
public class Contacted {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int contId;
    @Column(length = 30, name = "firstName")
    private String contFirstName;
    @Column(length = 30, name = "lastName")
    private String contLastName;
    @Column(length = 100, name = "emailId", unique = true)
    private String contEmail;

    public Contacted(int contId, String contFirstName, String contLastName, String contEmail) {
        this.contId = contId;
        this.contFirstName = contFirstName;
        this.contLastName = contLastName;
        this.contEmail = contEmail;
    }

    public Contacted(String contFirstName, String contLastName, String contEmail) {
        this.contFirstName = contFirstName;
        this.contLastName = contLastName;
        this.contEmail = contEmail;
    }

    public Contacted() {
    }

    public int getContId() {
        return contId;
    }

    public void setContId(int contId) {
        this.contId = contId;
    }

    public String getContFirstName() {
        return contFirstName;
    }

    public void setContFirstName(String contFirstName) {
        this.contFirstName = contFirstName;
    }

    public String getContLastName() {
        return contLastName;
    }

    public void setContLastName(String contLastName) {
        this.contLastName = contLastName;
    }

    public String getContEmail() {
        return contEmail;
    }

    public void setContEmail(String contEmail) {
        this.contEmail = contEmail;
    }

    @Override
    public String toString() {
        return "Contacted{" + "contId=" + contId + ", contFirstName=" + contFirstName + ", contLastName=" + contLastName + ", contEmail=" + contEmail + '}';
    }

}
