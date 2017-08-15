package com.frank.servicelmpl;

import com.frank.bean.Vid_comment;
import com.frank.dao.Vid_commentMapper;
import com.frank.service.Vid_commentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 啸 on 2017/5/28.
 */
@Service
public class Vid_commentServicelmpl implements Vid_commentService{
    @Autowired()
    private Vid_commentMapper vid_commentMapper;

    public List<Vid_comment> findCommentsByTopicId(int topicId) {
        return vid_commentMapper.findCommentsByTopicId(topicId);
    }

    public void addComments(Vid_comment comment) {
        vid_commentMapper.addComments(comment);

    }

    public void likeComment(int commentId) {
        vid_commentMapper.likeComment(commentId);

    }
}
