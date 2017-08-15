package com.frank.dao;

import com.frank.bean.Pic_topic;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 啸 on 2017/5/24.
 */
@Repository
public interface Pic_topicMapper {
    public List<Pic_topic> showMyTopics(String userName);
    public Pic_topic findTopicByTitle(String title);
    public void savePic_topic(Pic_topic topic);
    public void deletePic_topicByTopicId(int topicId);
    public List<Pic_topic> findPic_topicsByTag(String tag);
    public void likePic_topic(int topicId);
}
