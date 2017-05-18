package com.kantiana.skb.web;

import com.kantiana.skb.model.Comment;
import com.kantiana.skb.model.News;
import com.kantiana.skb.model.User;
import com.kantiana.skb.service.CommentService;
import com.kantiana.skb.service.NewsService;
import com.kantiana.skb.service.SecurityService;
import com.kantiana.skb.service.UserService;
import com.kantiana.skb.validator.UserValidator;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.lang.String;
import java.util.LinkedList;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private NewsService newsService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private SecurityService securityService;
    @Autowired
    private UserValidator userValidator;

    // Контроллер главной страницы
    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public String index(Model model, String logout) {
        // Передаём в index.jsp все новости
        List<News> news = newsService.getAllNews();
        model.addAttribute("news", news);
        // Если пользователь вышел сообщаем ему об этом
        if (logout != null) {
            model.addAttribute("logoutMessage", "Вы успешно вышли");
        }
        return "index";
    }

    // Контроллер страницы регистрации
    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());
        return "registration";
    }

    // Контроллер, регистрирующий пользователя
    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);
        if (bindingResult.hasErrors()) {
            return "registration";
        }
        userService.save(userForm);
        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());
        return "redirect:/";
    }

    // Контроллер страницы входа
    @RequestMapping(value = "/authorization", method = RequestMethod.GET)
    public String authorization(Model model, String error) {
        if (error != null) {
            model.addAttribute("error", "Ваше имя и пароль не действительны.");
        }
        return "authorization";
    }

    // Контроллер личного кабинета
    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String profile(Model model) {
        // Достаём информацию о текущем пользователе и передаём её в .jsp
        String username = securityService.findLoggedInUsername();
        User user = userService.findByUsername(username);
        model.addAttribute("user", user);
        return "profile";
    }

    //Контроллер списка новостей
    @RequestMapping(value = "/news", method = RequestMethod.GET)
    public String news(Model model) {
        List<News> newsList= newsService.getAllNews();
        model.addAttribute("newsList", newsList);
        return "news";
    }

    //Контроллер списка новостей
    @RequestMapping(value = "/news-detailed", method = RequestMethod.GET)
    public String newsDetailed(Model model, Long newsId) {
        News news = newsService.findById(newsId);
        model.addAttribute("news", news);
        model.addAttribute("commentForm", new Comment());
        return "news-detailed";
    }

    //Контроллер списка новостей
    @RequestMapping(value = "/news-detailed", method = RequestMethod.POST)
    public String newsDetailed(@ModelAttribute("commentForm") Comment commentForm, BindingResult bindingResult, Model model, Long newsId) {
        if (bindingResult.hasErrors()) {
            return "news-detailed";
        }
        commentService.save(commentForm);
        News news = newsService.findById(newsId);
        model.addAttribute("news", news);
        return "news-detailed";
    }
}
