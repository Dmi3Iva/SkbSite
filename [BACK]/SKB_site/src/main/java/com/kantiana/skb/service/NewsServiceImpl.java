package com.kantiana.skb.service;

import com.kantiana.skb.model.News;
import com.kantiana.skb.model.Project;
import com.kantiana.skb.repository.NewsRepository;
import com.sun.org.apache.xpath.internal.operations.Mult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;
import java.util.List;

import static com.kantiana.skb.web.WorkingWithFile.uploadFile;

@Service
public class NewsServiceImpl implements NewsService {
    @Autowired
    private NewsRepository newsRepository;
    @Autowired
    private SecurityService securityService;

    private boolean isLegalProjectId(Long projectId) {
        return projectId > 0;
    }

    @Override
    public void save(News news) {
        if (news == null) {
            return;
        }
        news.setTimeOfLastUpdate(new Timestamp(System.currentTimeMillis()));
        if (news.getProject() != null && !isLegalProjectId(news.getProject().getId())) {
            news.setProject(null);
        }
        newsRepository.save(news);
    }

    @Override
    public void save(News news) {
        if (news == null) {
            return;
        }
        news.setAuthor(securityService.findLoggedUser());
        news.setTimeOfCreation(new Timestamp(System.currentTimeMillis()));
        save(news);
    }

    @Override
    public void update(News news, MultipartFile image) {
        News oldNews= findById(news.getId());
        if(oldNews == null) {
            return;
        }
        if (image != null && image.getSize() > 0) {
            String photoPath = uploadFile(image);
        }
        oldNews.setEditor(securityService.findLoggedUser());
        oldNews.setName(news.getName());
        oldNews.setContent(news.getContent());
        save(oldNews);
    }

    public void delete(Long newsId){
        newsRepository.delete(newsId);
    }

    public void delete(News news) {
        newsRepository.delete(news);
    }

    public List<News> getAllNews() {
        return newsRepository.findAll();
    }

    public News findById(Long id) {
        return newsRepository.findById(id);
    }

    public List<News> findAllByProjectIdOrderByTimeOfCreation(Long projectId) {
        return newsRepository.findAllByProjectIdOrderByTimeOfCreation(projectId);
    }

    public List<News> findAllByOrderByTimeOfCreation() {
        return newsRepository.findAllByOrderByTimeOfCreation();
    }

    @Override
    public List<News> findTop(int number) {
        List<News> topList = newsRepository.findTop();
        while (number < topList.size()){
            topList.remove(number);
        }
        return topList;
    }
}
