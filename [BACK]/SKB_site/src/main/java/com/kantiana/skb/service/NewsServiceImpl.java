package com.kantiana.skb.service;

import com.kantiana.skb.model.News;
import com.kantiana.skb.repository.NewsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

@Service
public class NewsServiceImpl implements NewsService {
    @Autowired
    private NewsRepository newsRepository;

    public void save(News news) {
        news.setTimeOfCreation(new Timestamp(System.currentTimeMillis()));
        newsRepository.save(news);
    }

    public List<News> getAllNews() {
        return newsRepository.findAll();
    }

    @Override
    public News findById(Long id) {
        return null;
    }
}
