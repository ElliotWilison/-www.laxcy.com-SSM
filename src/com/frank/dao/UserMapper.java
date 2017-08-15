package com.frank.dao;

import com.frank.bean.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * Created by 啸 on 2017/5/24.
 */
@Repository
public interface UserMapper {
    public User userLogin(@Param("userName") String userName,@Param("pwd") String pwd);
    public void registerSave(@Param("userName") String userName,@Param("pwd") String pwd);
    public User findUserByName(String userName);
    public void updatePersonalInfo(User user);
    public void updatePersonalImg(@Param("userName")String userName,@Param("userImg")String userImg);
    public void bindUserMail(@Param("userName")String userName, @Param("mail")String mail);
    public void bindUserPhone(@Param("userName")String userName,@Param("phone")String phone);


}
