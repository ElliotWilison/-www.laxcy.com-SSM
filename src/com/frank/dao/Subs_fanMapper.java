package com.frank.dao;

import com.frank.bean.Fan;
import com.frank.bean.Subscribe;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 啸 on 2017/6/1.
 */
@Repository
public interface Subs_fanMapper {
    public  int countUserSubscribe(@Param("username") String username);
    public int countUserFans(@Param("username")String username);
    public List<Subscribe> showUserSubscribe(@Param("username")String username);
    public void unfollowUser(@Param("username")String username,String sub_name);
    public  void followUser(@Param("username")String username,String sub_name);
    public  List<Fan> showUserFans(@Param("username")String username);
}
