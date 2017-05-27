package com.kantiana.skb.repository;

import com.kantiana.skb.model.Project;
import org.springframework.data.jpa.repository.JpaRepository;
import com.kantiana.skb.model.News;

import java.util.List;

public interface NewsRepository extends JpaRepository<News, Long> {
    News findById(Long id);

    List<News> findAllByProjectIdOrderByTimeOfCreation(Long projectId);

    List<News> findAllByOrderByTimeOfCreation();
}
