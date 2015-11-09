package ru.spring.MVC.java.services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import ru.spring.MVC.java.dao.ProductDao;
import ru.spring.MVC.java.models.Product;

@Service(value = "productService")
public class ProductService {

    @Autowired
    @Qualifier("productDatabaseDao")
    private ProductDao productDao;
    
    public ProductService() {
    }
    
    public List<Product> getAll() {
        return productDao.getAll();
    }
}
