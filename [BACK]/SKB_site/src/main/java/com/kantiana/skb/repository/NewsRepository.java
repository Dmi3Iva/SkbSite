package com.kantiana.skb.repository;

import com.kantiana.skb.model.News;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NewsRepository extends JpaRepository<News, Long>{
}
