package com.kantiana.skb.service;

import com.kantiana.skb.model.News;
import com.kantiana.skb.repository.NewsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsServiceImpl implements NewsService {
    @Autowired
    private NewsRepository newsRepository;

    public void save(News news) {
        newsRepository.save(news);
    }

    public List<News> getAll() {
        return newsRepository.findAll();
    }
}
