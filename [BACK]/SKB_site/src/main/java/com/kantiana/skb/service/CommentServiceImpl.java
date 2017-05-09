package com.kantiana.skb.service;

import com.kantiana.skb.model.Comment;
import com.kantiana.skb.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    CommentRepository commentRepository;

    public List<Comment> getAll() {
        return commentRepository.findAll();
    }
}
