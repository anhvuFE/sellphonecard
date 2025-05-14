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
@lombok.AllArgsConstructor
@lombok.Getter
@lombok.Setter
@lombok.NoArgsConstructor
public class Product {

    private int id;
    private String name;
    private double sellPrice;
    private int amount;
    private String supplier;
    private String image;
    private Date expirationDate;
    private String description;
    private Date createdAt;
    private Date deleteAt;
    private boolean status;
    private String accountId;
    private Date updateAt;
    

    public Product(String supplier, String image) {
        this.supplier = supplier;
        this.image = image;
    }

    public Product(String supplier, double menhGia, int quantity, int id, boolean status) {
        this.supplier = supplier;
        this.amount = quantity;
        this.sellPrice = menhGia;
        this.id = id;
        this.status = status;
    }

    public Product(String supplier, double menhGia, int quantity, int id) {
        this.supplier = supplier;
        this.amount = quantity;
        this.sellPrice = menhGia;
        this.id = id;
    }

}
