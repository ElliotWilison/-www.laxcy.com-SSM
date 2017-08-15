package com.frank.service;

import com.frank.bean.Fan;
import com.frank.bean.Subscribe;

import java.util.List;

/**
 * Created by 啸 on 2017/6/1.
 */
public interface Subs_fanService {
    public  int countUserSubscribe(String username);
    public int countUserFans(String username);
    public List<Subscribe> showUserSubscribe(String username);
    public void unfollowUser(String username,String sub_name);
    public  void followUser(String username,String sub_name);
    public  List<Fan> showUserFans(String username);
}
