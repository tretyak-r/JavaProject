package ru.spring.MVC.java.dao.impl;

import org.springframework.stereotype.Repository;
import ru.spring.MVC.java.dao.OrderDao;
import ru.spring.MVC.java.models.Order;

@Repository(value = "orderDatabaseDao")
public class OrderDatabaseDao extends HibernateAbstractDao<Order> implements OrderDao{

    public OrderDatabaseDao() {

    }


}
