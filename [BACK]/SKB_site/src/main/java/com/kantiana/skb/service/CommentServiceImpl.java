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

    public void save(Comment comment) {
        commentRepository.save(comment);
    }

    @Override
    public void save(Comment comment, Long newsId) {
        News news = newsService.findById(newsId);
        if (news == null) {
            return;
        }
        comment.setNews(news);
        comment.setAuthor(securityService.findLoggedUser());
        comment.setTimeOfCreation(new Timestamp(System.currentTimeMillis()));
        save(comment);
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
