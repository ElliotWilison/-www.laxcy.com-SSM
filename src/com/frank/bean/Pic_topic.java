package com.frank.bean;

import java.util.Date;
import java.util.List;

/**
 * Created by 啸 on 2017/5/20.
 */
public class Pic_topic {

    public int topicId;
    public int user_name;
    public String title;
    public String content;
    public String tags;
    public Date uploadTime;
    public int likes;



    public int getTopicId() {
        return topicId;
    }

    public void setTopicId(int topicId) {
        this.topicId = topicId;
    }

    public int getUser_name() {
        return user_name;
    }

    public void setUser_name(int user_name) {
        this.user_name = user_name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public Date getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Date uploadTime) {
        this.uploadTime = uploadTime;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }


}
