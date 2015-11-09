package ru.spring.MVC.java.contorolles;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeContoroller {
    
    public HomeContoroller () {
    
    }
    @RequestMapping(value = "/home", method=RequestMethod.GET)
    public ModelAndView index() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("home");
        return modelAndView;
        
        
    }
    
    
    
    
}
