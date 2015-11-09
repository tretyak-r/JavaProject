package ru.spring.MVC.java.helpers;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component(value = "passwordHelper")
public class PasswordHelper implements PasswordEncoder{

    private MessageDigest md;
    
    public PasswordHelper() {
        try {
            md = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(PasswordHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static String hash (CharSequence rawPassword) {
        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(PasswordHelper.class.getName()).log(Level.SEVERE, null, ex);
        }    
        
        if (md == null){
            return rawPassword.toString();
        }
        
        md.update(rawPassword.toString().getBytes());
        
        byte byteData[] = md.digest();
        
        StringBuffer hexString = new StringBuffer();
        for(int i=0; i < byteData.length; i++) {
            String hex = Integer.toHexString(0xff & byteData[i]);
            if(hex.length() == 1){
                hexString.append('0');
            }
            hexString.append(hex);
        }
        return hexString.toString();
    }    
    
    public static void main(String[] args) {
        System.out.println(hash("admin"));
        System.out.println(hash("user"));
    }
    
    @Override
    public String encode(CharSequence rawPassword) {
        if(md == null) {
        return rawPassword.toString();
    }
        md.update(rawPassword.toString().getBytes());
        
        byte byteData[] = md.digest();
        
        StringBuffer hexString = new StringBuffer();
        for(int i=0; i < byteData.length; i++) {
            String hex = Integer.toHexString(0xff & byteData[i]);
            if(hex.length() == 1){
                hexString.append('0');
            }
            hexString.append(hex);
        }
        return hexString.toString();
    }

    @Override
    public boolean matches(CharSequence rawPassword, String encoderPassword) {
        return encode(rawPassword).equals(encoderPassword);
    }
    
    
    
}
