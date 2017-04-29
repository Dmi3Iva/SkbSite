package com.kantiana.skb.web;

import com.kantiana.skb.model.News;
import com.kantiana.skb.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.lang.String;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    private NewsService newsService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String main(Model model) {
        // Передаём в index.jsp все новости
        List<News> news = newsService.getAllNews();
        model.addAttribute("news", news);

        return "index";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registrationGet(Model model) {
        // Передаём в index.jsp все новости
        //List<News> news = newsService.getAllNews();
        //model.addAttribute("news", news);

        return "registration";
    }


}
