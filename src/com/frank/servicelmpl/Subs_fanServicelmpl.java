package com.frank.servicelmpl;

import com.frank.bean.Fan;
import com.frank.bean.Subscribe;
import com.frank.dao.Subs_fanMapper;
import com.frank.service.Subs_fanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 啸 on 2017/6/1.
 */
@Service
public class Subs_fanServicelmpl implements Subs_fanService {
    @Autowired()
    private Subs_fanMapper subs_fanMapper;
    public int countUserSubscribe(String username) {
        return subs_fanMapper.countUserSubscribe(username);
    }

    public int countUserFans(String username) {
        return subs_fanMapper.countUserFans(username);
    }

    public List<Subscribe> showUserSubscribe(String username) {
        return subs_fanMapper.showUserSubscribe(username);
    }

    public void unfollowUser(String username, String sub_name) {
        subs_fanMapper.unfollowUser(username,sub_name);

    }

    public void followUser(String username, String sub_name) {
        subs_fanMapper.followUser(username,sub_name);

    }

    public List<Fan> showUserFans(String username) {
        return subs_fanMapper.showUserFans(username);
    }


}
