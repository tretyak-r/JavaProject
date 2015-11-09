
package ru.spring.MVC.java.services;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.spring.MVC.java.dao.UserDao;
import ru.spring.MVC.java.models.User;

@Service(value = "userService")
public class UserService implements UserDetailsService{
    
    @Autowired()
    @Qualifier(value = "userFileDao")
    private UserDao userDao;
    
    public UserService() {
    }
    
    @Override
    public UserDetails loadUserByUsername(String username) 
            throws UsernameNotFoundException {
        User user = userDao.getByUsername(username);
        if (user == null){
            try {
                throw UsernameNotFoundException("Username with Username: " + username + " not found!");
            } catch (Exception ex) {
                Logger.getLogger(UserService.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return user;    
    }
    
    @Transactional
    public List<User> getAll(){
        return userDao.getAll();
    }

    private Exception UsernameNotFoundException(String string) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
