package com.frank.dao;

import com.frank.bean.Pic_comment;
import com.frank.bean.Vid_comment;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 啸 on 2017/5/28.
 */
@Repository
public interface Vid_commentMapper {
    public List<Vid_comment> findCommentsByTopicId(int topicId);
    public void addComments(Vid_comment comment);
    public void likeComment(int commentId);
}
