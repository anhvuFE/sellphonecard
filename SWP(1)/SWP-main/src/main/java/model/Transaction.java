/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package model;

import java.util.Date;
import jxl.write.DateTime;

/**
 *
 * @author PC
 */
@lombok.AllArgsConstructor
@lombok.Getter
@lombok.Setter
@lombok.NoArgsConstructor
public class Transaction {

    private int id;
    private double buyPrice;
    private int buyAmount;
    private Date createdAt;
    private Date deleteAt;
    private String accountId;
    private String description;
    private int productId;

    public Transaction(int id, double buyPrice, int buyAmount, Date createdAt, String description) {
        this.id = id;
        this.buyPrice = buyPrice;
        this.buyAmount = buyAmount;
        this.createdAt = createdAt;
        this.description = description;
    }

    public Transaction(int id, double buyPrice, int buyAmount, Date createdAt, String description, String accountId) {
        this.id = id;
        this.buyPrice = buyPrice;
        this.buyAmount = buyAmount;
        this.createdAt = createdAt;
        this.description = description;
        this.accountId = accountId;
    }

}
