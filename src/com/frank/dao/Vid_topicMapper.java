package com.frank.dao;

import com.frank.bean.Vid_topic;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 啸 on 2017/5/28.
 */
@Repository
public interface Vid_topicMapper {
    public List<Vid_topic> showMyTopics(String userName);
    public Vid_topic findTopicByTitle(String title);
    public void save_topic(Vid_topic topic);
    public void delete_topicByTopicId(int topicId);
    public List<Vid_topic> findVid_topicsByTag(String tag);
    public void like_topic(int topicId);
}
