package com.kantiana.skb.service;

import com.kantiana.skb.model.Comment;
import com.kantiana.skb.model.News;
import com.kantiana.skb.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentRepository commentRepository;
    @Autowired
    private NewsService newsService;
    @Autowired
    private SecurityService securityService;

    @Override
    public Comment findById(Long newsId) {
        return commentRepository.findById(newsId);
    }

    @Override
    public void save(Comment comment) {
        comment.setAuthor(securityService.findLoggedUser());
        if (comment.getTimeOfCreation() == null) {
            comment.setTimeOfCreation(new Timestamp(System.currentTimeMillis()));
        }
        commentRepository.save(comment);
    }

    @Override
    public void delete(Long commentId) {
        commentRepository.delete(commentId);
    }

    public List<Comment> getAllComments() {
        return commentRepository.findAll();
    }

    public List<Comment> findAllByNewsIdOrderByTimeOfCreation(Long newsId) {
        return commentRepository.findAllByNewsIdOrderByTimeOfCreation(newsId);
    }
}
