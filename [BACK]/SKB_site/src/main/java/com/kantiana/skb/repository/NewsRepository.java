package com.kantiana.skb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.kantiana.skb.model.News;

public interface NewsRepository extends JpaRepository<News, Long> {
}
