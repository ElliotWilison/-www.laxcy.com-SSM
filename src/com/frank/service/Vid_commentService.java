package com.frank.service;

import com.frank.bean.Vid_comment;

import java.util.List;

/**
 * Created by 啸 on 2017/5/28.
 */
public interface Vid_commentService {
    public List<Vid_comment> findCommentsByTopicId(int topicId);
    public void addComments(Vid_comment comment);
    public void likeComment(int commentId);
}
