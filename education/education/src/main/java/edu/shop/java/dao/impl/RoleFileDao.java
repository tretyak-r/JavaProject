package edu.shop.java.dao.impl;

import java.util.List;
import org.springframework.stereotype.Repository;
import edu.shop.java.dao.RoleDao;
import edu.shop.java.models.Role;

@Repository (value = "roleFileDao")
public class RoleFileDao extends FileAbstractDao<Role> implements RoleDao{

    public RoleFileDao() {
    
    }

    @Override
    public String getDataSourceName() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Role> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Role getById(long id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


}
