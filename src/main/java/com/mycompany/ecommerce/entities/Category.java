package com.mycompany.ecommerce.entities;

import java.util.*;
import javax.persistence.*;

@Entity
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int categoryId;
    private String categoryTitle;
    private String categoryDesc;
    @OneToMany(mappedBy = "category")
    private List<Product> products = new ArrayList<>();

    public Category(int categoryId, String categoryTitle, String categoryDesc, List<Product> products) {
        this.categoryId = categoryId;
        this.categoryTitle = categoryTitle;
        this.categoryDesc = categoryDesc;
        this.products = products;
    }

    public Category(String categoryTitle, String categoryDesc, List<Product> products) {
        this.categoryTitle = categoryTitle;
        this.categoryDesc = categoryDesc;
        this.products = products;
    }

    public Category() {
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryTitle() {
        return categoryTitle;
    }

    public void setCategoryTitle(String categoryTitle) {
        this.categoryTitle = categoryTitle;
    }

    public String getCategoryDesc() {
        return categoryDesc;
    }

    public void setCategoryDesc(String categoryDesc) {
        this.categoryDesc = categoryDesc;
    }

    @Override
    public String toString() {
        return "Category{" + "categoryId=" + categoryId + ", categoryTitle=" + categoryTitle + ", categoryDesc=" + categoryDesc + '}';
    }
    
    
}
