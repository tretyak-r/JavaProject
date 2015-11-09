package ru.spring.MVC.java.dao;

import java.util.List;
import ru.spring.MVC.java.models.Model;

public interface ItemDao <T extends Model> {
    
    
    public List <T> getAll();
    
    public T getById (long id);
    
    public void add (T model);
    
    public void update (T model);
    
    public void remove (T model);
    
    
}
