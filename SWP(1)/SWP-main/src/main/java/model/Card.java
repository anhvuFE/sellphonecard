/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author PC
 */
public class Card {

    private int id;
    private String seri;
    private String code;
    private double price;
    private boolean isBuy;
    private Date expirationDate;
    private int transactionId;
    private Date createdAt;
    private int productId;

    public Card() {

    }

    public Card(int id, String seri, String code, double price, boolean isBuy, Date expirationDate, int transactionId, Date createdAt, int productId) {
        this.id = id;
        this.seri = seri;
        this.code = code;
        this.price = price;
        this.isBuy = isBuy;
        this.expirationDate = expirationDate;
        this.transactionId = transactionId;
        this.createdAt = createdAt;
        this.productId = productId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSeri() {
        return seri;
    }

    public void setSeri(String seri) {
        this.seri = seri;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public boolean isIsBuy() {
        return isBuy;
    }

    public void setIsBuy(boolean isBuy) {
        this.isBuy = isBuy;
    }

    public Date getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(Date expirationDate) {
        this.expirationDate = expirationDate;
    }

    public int getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(int transactionId) {
        this.transactionId = transactionId;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        if (createdAt == null) {
            this.createdAt = new Date(); // Gán giá trị mặc định là thời gian hiện tại
        } else {
            this.createdAt = createdAt;
        }
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public Card(String seri, String code, double price, Date expirationDate, Date createdAt, int productId) {
        this.seri = seri;
        this.code = code;
        this.price = price;
        this.expirationDate = expirationDate;
        this.createdAt = createdAt;
        this.productId = productId;
    }

}
