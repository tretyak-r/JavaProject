package ru.spring.MVC.java.dao.impl;

import ru.spring.MVC.java.dao.accessors.FileDataSourseAccesor;
import ru.spring.MVC.java.models.Model;

public abstract class FileAbstractDao<T extends Model> extends FileDataSourseAccesor{
    
    public void add(T model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void update(T model) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void remove (T model){

    }
    
}
