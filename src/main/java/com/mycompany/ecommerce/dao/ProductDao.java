package com.mycompany.ecommerce.dao;

import com.mycompany.ecommerce.entities.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class ProductDao {

    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }

    // Saving product to database
    public boolean saveProduct(Product prod) {
        boolean f = false;
        try {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();

            session.save(prod);
            tx.commit();

            session.close();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
            f = false;
        }
        return f;
    }

    // Get all products
    public List<Product> getAllProducts() {
        Session session = this.factory.openSession();
        Query query = session.createQuery("from Product");
        List<Product> list = query.list();
        session.close();
        return list;
    }

    // Get products by category id
    public List<Product> getProductsById(int cid) {
        Session session = this.factory.openSession();
        Query query = session.createQuery("from Product as p where p.category.categoryId =: id");
        query.setParameter("id", cid);
        List<Product> list = query.list();
        session.close();
        return list;
    }
}
