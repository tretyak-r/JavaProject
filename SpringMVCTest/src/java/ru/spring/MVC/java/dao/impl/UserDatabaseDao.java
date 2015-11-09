package ru.spring.MVC.java.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import ru.spring.MVC.java.dao.UserDao;
import ru.spring.MVC.java.models.User;

@Repository(value = "userDatabaseDao")
public class UserDatabaseDao extends HibernateAbstractDao<User> implements UserDao{

    public UserDatabaseDao() {
    
    }

    @Override
    public User getByUsername(String username) {
        Criteria criteria = getSession().createCriteria(User.class);
        criteria.add(Restrictions.eq("username", username));
        return (User) criteria.uniqueResult();
    }

    
}
