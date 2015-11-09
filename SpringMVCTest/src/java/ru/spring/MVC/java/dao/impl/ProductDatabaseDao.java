package ru.spring.MVC.java.dao.impl;

import org.springframework.stereotype.Repository;
import ru.spring.MVC.java.dao.ProductDao;
import ru.spring.MVC.java.models.Product;


@Repository(value = "productDatabaseDao")
public class ProductDatabaseDao extends HibernateAbstractDao<Product> implements ProductDao{

    public ProductDatabaseDao() {
    
    }

}
