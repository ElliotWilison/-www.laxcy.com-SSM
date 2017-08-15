package com.frank.servicelmpl;

import com.frank.bean.Vid_topic;
import com.frank.dao.Vid_topicMapper;
import com.frank.service.Vid_topicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 啸 on 2017/5/28.
 */
@Service
public class Vid_topicServicelmpl  implements Vid_topicService{
    @Autowired()
    private Vid_topicMapper vid_topicMapper;
    public List<Vid_topic> showMyTopics(String userName) {
        return vid_topicMapper.showMyTopics(userName);
    }

    public Vid_topic findTopicByTitle(String title) {
        return vid_topicMapper.findTopicByTitle(title);
    }

    public void save_topic(Vid_topic topic) {
vid_topicMapper.save_topic(topic);
    }

    public void delete_topicByTopicId(int topicId) {
vid_topicMapper.delete_topicByTopicId(topicId);
    }

    public List<Vid_topic> findVid_topicsByTag(String tag) {

        return vid_topicMapper.findVid_topicsByTag(tag);
    }

    public void like_topic(int topicId) {
        vid_topicMapper.like_topic(topicId);

    }
}
