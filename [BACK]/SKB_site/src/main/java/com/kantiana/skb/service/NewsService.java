package com.kantiana.skb.service;

import com.kantiana.skb.model.News;
import com.kantiana.skb.model.Project;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface NewsService {
    void save(News news);

    void save(News news, MultipartFile image);

    void update(News news, MultipartFile image);

    List<News> getAllNews();

    News findById(Long id);

    void delete(Long newsId);

    void delete(News news);

    List<News> findAllByProjectIdOrderByTimeOfCreation(Long projectId);

    List<News> findAllByOrderByTimeOfCreation();

    List<News> findTop(int number);
}
