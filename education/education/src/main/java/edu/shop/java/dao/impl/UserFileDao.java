package edu.shop.java.dao.impl;

import java.util.List;
import org.springframework.stereotype.Repository;
import edu.shop.java.dao.UserDao;
import edu.shop.java.models.User;

@Repository("userFileDao")
public class UserFileDao extends FileAbstractDao<User> implements UserDao{

    public UserFileDao() {
    
    }

    @Override
    public String getDataSourceName() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<User> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public User getById(long id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public User getByUsername(String username) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

 
}
