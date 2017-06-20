package com.kantiana.skb.service;

import com.kantiana.skb.model.Comment;
import com.kantiana.skb.model.News;

import java.util.List;

public interface CommentService {
    void save(Comment comment);

    void save(Comment comment, Long newsId);

    Comment findById(Long newsId);

    void delete(Long commentId);

    List<Comment> getAllComments();

    List<Comment> findAllByNewsIdOrderByTimeOfCreation(Long newsId);
}
