package com.frank.servicelmpl;

import com.frank.bean.Pic_comment;
import com.frank.dao.Pic_commentMapper;
import com.frank.service.Pic_commentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 啸 on 2017/5/25.
 */
@Service
public class Pic_commentServicelmpl implements Pic_commentService {
    @Autowired()
    private Pic_commentMapper pic_commentMapper;

    public List<Pic_comment> findCommentsByTopicId(int topicId) {
        return pic_commentMapper.findCommentsByTopicId(topicId);
    }

    public void addComments(Pic_comment comment) {
        pic_commentMapper.addComments(comment);

    }

    public void likeComment(int commentId) {
        pic_commentMapper.likeComment(commentId);

    }
}
