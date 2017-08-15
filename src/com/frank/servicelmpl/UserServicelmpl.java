package com.frank.servicelmpl;

import com.frank.bean.User;
import com.frank.dao.UserMapper;
import com.frank.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 啸 on 2017/5/24.
 */
@Service
public class UserServicelmpl implements UserService{
    @Autowired()
    private UserMapper userDAO;

    public User userLogin(String userName, String pwd) {
        return userDAO.userLogin(userName,pwd);
    }

    public void registerSave(String userName, String pwd) {
        userDAO.registerSave(userName,pwd);
    }

    public User findUserByName(String userName) {
        return userDAO.findUserByName(userName);
    }

    public void updatePersonalInfo(User user) {
userDAO.updatePersonalInfo(user);
    }

    public void updatePersonalImg(String userName, String userImg) {
        userDAO.updatePersonalImg(userName,userImg);
    }

    public void bindUserMail(String userName, String mail) {

    }

    public void bindUserPhone(String userName, String phone) {
userDAO.bindUserPhone(userName,phone);
    }
}
