package edu.shop.java.dao.impl;

import java.util.List;
import org.springframework.stereotype.Repository;
import edu.shop.java.dao.OrderDao;
import edu.shop.java.models.Order;

@Repository(value = "orderFileDao")
public class OrderFileDao extends FileAbstractDao<Order> implements OrderDao{

    public OrderFileDao() {

    }

    @Override
    public String getDataSourceName() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Order> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Order getById(long id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
