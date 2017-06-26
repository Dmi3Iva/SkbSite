package com.kantiana.skb.service;

import com.kantiana.skb.model.AboutPage;
import com.kantiana.skb.repository.AboutPageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AboutPageServiceImpl implements AboutPageService {
    @Autowired
    AboutPageRepository aboutPageRepository;

    public AboutPage getPage()
    {
        return aboutPageRepository.findById(1L);
    }

    public void save (AboutPage aboutPage){
        aboutPageRepository.save(aboutPage);
    }
}