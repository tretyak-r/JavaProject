package ru.spring.MVC.java.dao;

import ru.spring.MVC.java.models.User;

public interface UserDao extends ItemDao<User> {

    public User getByUsername(String username);
    
}
