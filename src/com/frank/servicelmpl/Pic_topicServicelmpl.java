package com.frank.servicelmpl;

import com.frank.bean.Pic_topic;
import com.frank.dao.Pic_topicMapper;
import com.frank.service.Pic_topicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 啸 on 2017/5/28.
 */
@Service
public class Pic_topicServicelmpl implements Pic_topicService{
    @Autowired()
    private Pic_topicMapper pic_topicMapper;


    public List<Pic_topic> showMyTopics(String userName) {
        return pic_topicMapper.showMyTopics(userName);
    }

    public Pic_topic findTopicByTitle(String title) {
        return pic_topicMapper.findTopicByTitle(title);
    }

    public void savePic_topic(Pic_topic topic) {
        pic_topicMapper.savePic_topic(topic);

    }

    public void deletePic_topicByTopicId(int topicId) {
        pic_topicMapper.deletePic_topicByTopicId(topicId);

    }

    public List<Pic_topic> findPic_topicsByTag(String tag) {
        return pic_topicMapper.findPic_topicsByTag(tag);
    }

    public void likePic_topic(int topicId) {
        pic_topicMapper.likePic_topic(topicId);

    }
}
