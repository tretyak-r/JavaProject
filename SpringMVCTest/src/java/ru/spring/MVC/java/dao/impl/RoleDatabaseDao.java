package ru.spring.MVC.java.dao.impl;

import org.springframework.stereotype.Repository;
import ru.spring.MVC.java.dao.RoleDao;
import ru.spring.MVC.java.models.Role;

@Repository(value = "roleDatabaseDao")
public class RoleDatabaseDao extends HibernateAbstractDao<Role> implements RoleDao{

    public RoleDatabaseDao() {
    
    }

}
