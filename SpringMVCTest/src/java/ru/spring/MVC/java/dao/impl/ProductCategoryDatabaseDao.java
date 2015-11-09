package ru.spring.MVC.java.dao.impl;

import org.springframework.stereotype.Repository;
import ru.spring.MVC.java.dao.ProductCategoryDao;
import ru.spring.MVC.java.models.ProductCategory;

@Repository (value = "productCategoryDatabaseDao")
public class ProductCategoryDatabaseDao extends HibernateAbstractDao<ProductCategory> implements ProductCategoryDao{

    public ProductCategoryDatabaseDao() {
    
    }
   
}
