package com.frank.service;

import com.frank.bean.Pic_topic;

import java.util.List;

/**
 * Created by 啸 on 2017/5/28.
 */
public interface Pic_topicService {
    public List<Pic_topic> showMyTopics(String userName);
    public Pic_topic findTopicByTitle(String title);
    public void savePic_topic(Pic_topic topic);
    public void deletePic_topicByTopicId(int topicId);
    public List<Pic_topic> findPic_topicsByTag(String tag);
    public void likePic_topic(int topicId);
}
