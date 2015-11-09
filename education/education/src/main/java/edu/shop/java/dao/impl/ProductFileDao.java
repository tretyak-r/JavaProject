package edu.shop.java.dao.impl;

import java.util.List;
import org.springframework.stereotype.Repository;
import edu.shop.java.dao.ProductDao;
import edu.shop.java.models.Product;

@Repository(value = "productFileDao")
public class ProductFileDao extends FileAbstractDao<Product> implements ProductDao{

    public ProductFileDao() {

    }
        
    @Override
    public String getDataSourceName() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Product> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Product getById(long id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
