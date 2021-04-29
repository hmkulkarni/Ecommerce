package com.mycompany.ecommerce.dao;

import com.mycompany.ecommerce.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class UserDao {

    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }

    // Get user by email ID and password
    public User getUserByDetails(String email, String password) {
        User user = null;

        try {

            String query = "FROM User where userEmail =: e and userPassword =: p";

            Session session = this.factory.openSession();

            Query q = session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("p", password);

            user = (User) q.uniqueResult();

            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
