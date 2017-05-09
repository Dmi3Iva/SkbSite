package com.kantiana.skb.service;

import com.kantiana.skb.model.Comment;

import java.util.List;

public interface CommentService {
    public void save(Comment comment);

    public List<Comment> getAll();
}
