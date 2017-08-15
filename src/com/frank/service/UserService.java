package com.frank.service;
import com.frank.bean.User;
/**
 * Created by 啸 on 2017/5/24.
 */

public interface UserService {
    public User userLogin(String userName, String pwd);
    public void registerSave(String userName, String pwd);
    public User findUserByName(String userName);
    public void updatePersonalInfo(User user);
    public void updatePersonalImg(String userName,String userImg);
    public void bindUserMail(String userName,String mail);
    public void bindUserPhone(String userName,String phone);
    
}
