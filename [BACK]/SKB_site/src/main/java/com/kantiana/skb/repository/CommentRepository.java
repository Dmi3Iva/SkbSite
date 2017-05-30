package com.kantiana.skb.repository;

import com.kantiana.skb.model.Comment;
import com.kantiana.skb.model.News;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment, Long> {
    List<Comment> findAllByNewsIdOrderByTimeOfCreation(Long newsId);
}
