package com.frank.service;

import com.frank.bean.Pic_comment;

import java.util.List;

/**
 * Created by 啸 on 2017/5/25.
 */
public interface Pic_commentService {
    public List<Pic_comment> findCommentsByTopicId(int topicId);
    public void addComments(Pic_comment comment);
    public void likeComment(int commentId);
}
