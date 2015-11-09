package edu.shop.java.dao.impl;

import edu.shop.java.dao.accessors.FileDataSourseAccesor;
import edu.shop.java.models.Model;

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
