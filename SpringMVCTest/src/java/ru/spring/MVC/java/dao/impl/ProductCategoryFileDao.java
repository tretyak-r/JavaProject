package ru.spring.MVC.java.dao.impl;

import java.util.List;
import org.springframework.stereotype.Repository;
import ru.spring.MVC.java.dao.ProductCategoryDao;
import ru.spring.MVC.java.models.ProductCategory;

@Repository(value = "productCategoryFileDao")
public class ProductCategoryFileDao extends FileAbstractDao<ProductCategory> implements ProductCategoryDao {

    public ProductCategoryFileDao() {
    
    }

    @Override
    public String getDataSourceName() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<ProductCategory> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ProductCategory getById(long id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
