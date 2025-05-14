/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package dao;

import java.util.Random;

/**
 *
 * @author PC
 */
public class CapchaDAO {

    public String getCapcha() {
        Random rand = new Random();
        String str = "0123456789";
        char[] captcha = new char[6];
        for (int i = 0; i < 6; i++) {
            captcha[i] = str.charAt(rand.nextInt(str.length()));
        }
        return String.valueOf(captcha);
    }

}
