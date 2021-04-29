package com.mycompany.ecommerce.entities;

import javax.persistence.*;

@Entity
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int productId;
    private String productTitle;
    @Column(length = 3000)
    private String productDesc;
    private String productImg;
    private int productPrice;
    private int productDiscount;
    private int productQty;
    @ManyToOne
    private Category category;

    public Product(int productId, String productTitle, String productDesc, String productImg, int productPrice, int productDiscount, int productQty, Category category) {
        this.productId = productId;
        this.productTitle = productTitle;
        this.productDesc = productDesc;
        this.productImg = productImg;
        this.productPrice = productPrice;
        this.productDiscount = productDiscount;
        this.productQty = productQty;
        this.category = category;
    }

    public Product(String productTitle, String productDesc, String productImg, int productPrice, int productDiscount, int productQty, Category category) {
        this.productTitle = productTitle;
        this.productDesc = productDesc;
        this.productImg = productImg;
        this.productPrice = productPrice;
        this.productDiscount = productDiscount;
        this.productQty = productQty;
        this.category = category;
    }

    public Product() {
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductTitle() {
        return productTitle;
    }

    public void setProductTitle(String productTitle) {
        this.productTitle = productTitle;
    }

    public String getProductDesc() {
        return productDesc;
    }

    public void setProductDesc(String productDesc) {
        this.productDesc = productDesc;
    }

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    public int getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }

    public int getProductDiscount() {
        return productDiscount;
    }

    public void setProductDiscount(int productDiscount) {
        this.productDiscount = productDiscount;
    }

    public int getProductQty() {
        return productQty;
    }

    public void setProductQty(int productQty) {
        this.productQty = productQty;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Product{" + "productId=" + productId + ", productTitle=" + productTitle + ", productDesc=" + productDesc + ", productImg=" + productImg + ", productPrice=" + productPrice + ", productDiscount=" + productDiscount + ", productQty=" + productQty + '}';
    }

    // Calculate price after discount
    public int priceAfterDiscount() {
        int dis = (int) ((this.getProductDiscount() / 100.0) * (this.getProductPrice()));
        return this.getProductPrice() - dis;
    }

}
