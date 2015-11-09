package ru.spring.MVC.java.contorolles;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import ru.spring.MVC.java.models.Product;
import ru.spring.MVC.java.services.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
    
    @Autowired
    @Qualifier("productService")
    private ProductService productService;
    
    public ProductController() {
    
    }
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView list() {
        ModelAndView modelAndView = new ModelAndView();
        
        List<Product> products = productService.getAll();
        
        modelAndView.addObject("products", products);
        modelAndView.setViewName("products");
        
        return modelAndView;
    }
    
}
