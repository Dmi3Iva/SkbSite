package com.kantiana.skb.repository;

import com.kantiana.skb.model.Project;
import com.sun.org.apache.bcel.internal.generic.NEW;
import org.springframework.data.jpa.repository.JpaRepository;
import com.kantiana.skb.model.News;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface NewsRepository extends JpaRepository<News, Long> {
    News findById(Long id);

    List<News> findAllByProjectIdOrderByTimeOfCreation(Long projectId);

    List<News> findAllByOrderByTimeOfCreation();

    @Query("SELECT n FROM News n ORDER BY n.timeOfCreation DESC")
    List<News> findTop();
}
