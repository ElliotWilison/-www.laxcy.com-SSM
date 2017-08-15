package com.frank.dao;

import com.frank.bean.Pic_comment;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 啸 on 2017/5/24.
 */
@Repository
public interface Pic_commentMapper {
    public List<Pic_comment> findCommentsByTopicId(int topicId);
    public void addComments(Pic_comment comment);
    public void likeComment(int commentId);
}
