
package edu.shop.java.dao.accessors;

import javax.sql.DataSource;

public abstract class DataBaseDataSourceAccessor {
    
    public DataSource load () {
        return null;
    }
    
    public abstract String getHost ();
    
    public abstract int getPort ();
    
}
