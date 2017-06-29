package com.kantiana.skb.web;

import com.kantiana.skb.model.*;
import com.kantiana.skb.service.*;
import com.kantiana.skb.validator.NewsValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.Timestamp;
import java.util.List;

import static com.kantiana.skb.web.WorkingWithFile.uploadFile;


@Controller
public class NewsController {
    @Autowired
    private UserService userService;

    @Autowired
    private NewsService newsService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private ProjectService projectService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private NewsValidator newsValidator;

    //-----------------------------------------
    //      ВСЕ НОВОСТИ
    //-----------------------------------------
    @RequestMapping(value = "/news", method = RequestMethod.GET)
    public String news(Model model, Long projectId) {
        User logUser = securityService.findLoggedUser();
        model.addAttribute("logUser", logUser);
        Project project = projectService.findById(projectId);
        if (projectId == null || project == null) {
            model.addAttribute("newsList", newsService.findAllByOrderByTimeOfCreation());
        } else {
            model.addAttribute("project", project);
            model.addAttribute("newsList", newsService.findAllByProjectIdOrderByTimeOfCreation(projectId));
        }
        return "news";
    }

    //-----------------------------------------
    //      КОНКРЕТНАЯ НОВОСТЬ
    //-----------------------------------------
    @RequestMapping(value = "/news-detailed", method = RequestMethod.GET)
    public String newsDetailed(Model model, @RequestParam("newsId") Long newsId) {
        User logUser = securityService.findLoggedUser();
        model.addAttribute("logUser", logUser);
        News news = newsService.findById(newsId);
        model.addAttribute("news", news);
        model.addAttribute("commentsForCurrentNews", commentService.findAllByNewsIdOrderByTimeOfCreation(newsId));
        model.addAttribute("commentForm", new Comment());
        return "news-detailed";
    }

    @RequestMapping(value = "/news-detailed", method = RequestMethod.POST)
    public String newsDetailed(@ModelAttribute("commentForm") Comment commentForm, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "news-detailed";
        }
        commentService.save(commentForm);
        return "redirect:/news-detailed?newsId=" + commentForm.getNews().getId(); // Нужно делать редирект вместо возвращения имени jsp, чтобы комментарий отобразился, очистился кэш и всё было хорошо.
    }

    //TODO: Метод должен быть DELETE
    @RequestMapping(value = "/delete-comment", method = RequestMethod.POST)
    public String editComment(Long newsId, Long commentId) {
        commentService.delete(commentId);
        return "redirect:/news-detailed?newsId=" + newsId;
    }

    //-----------------------------------------
    //      ДОБАВЛЕНИЕ НОВОСТЕЙ
    //-----------------------------------------
    @RequestMapping(value = "/add-news", method = RequestMethod.GET)
    public String addNews(Model model, Long projectId) {
        News news = new News();
        if (projectId == null) {
            model.addAttribute("allProjects", projectService.getAllProjects());
        } else {
            Project project = projectService.findById(projectId);
            news.setProject(project);
            //для борьбы с незаконным доступом
            User logUser = securityService.findLoggedUser();
            User captain = project.getCaptain();
            Boolean admin = false;
            for (Role i: logUser.getRoles()){
                if (i.getName().equals("ROLE_ADMIN")){
                    admin = true;
                    break;
                }
            }
            if (logUser.getId() != captain.getId() && !admin){
                return "redirect:/error403";
            }
        }
        model.addAttribute("news", news);
        return "add-news";
    }

    @RequestMapping(value = "/add-news", method = RequestMethod.POST)
    public String addNews(@ModelAttribute("news") News news, BindingResult bindingResult, Model model, @RequestParam("file") MultipartFile image, RedirectAttributes redirectAttributes) {
        newsValidator.validate(news, bindingResult);
        if (bindingResult.hasErrors()) {
            return "add-news";
        }
        newsService.save(news, image);
        redirectAttributes.addFlashAttribute("newsAddSuccess", "News.add.success");
        return "redirect:/news" + (news.getProject() != null ? "?projectId=" + news.getProject().getId() : "");
    }

    //-----------------------------------------
    //      РЕДАКТИРОВАНИЕ НОВОСТЕЙ
    //-----------------------------------------
    @RequestMapping(value = "/edit-news", method = RequestMethod.GET)
    public String editNews(Model model, Long newsId) {
        News news = newsService.findById(newsId);
        model.addAttribute("news", news);
        //для борьбы с незаконным доступом
        User logUser = securityService.findLoggedUser();
        User author = news.getAuthor();
        //Если новость привязана к проекту, то автором будет создатель проекта
        if (news.getProject() != null) {
            author = news.getProject().getCaptain();
        }
        Boolean admin = false;
        for (Role i: logUser.getRoles()){
            if (i.getName().equals("ROLE_ADMIN")){
                admin = true;
                break;
            }
        }
        if (logUser.getId() != author.getId() && !admin){
            return "redirect:/error403";
        }
        if (news.getProject() == null) {
            model.addAttribute("allProjects", projectService.getAllProjects());
        }
        return "add-news";
    }

    @RequestMapping(value = "/edit-news", method = RequestMethod.POST)
    public String editNews(@ModelAttribute("news") News news, BindingResult bindingResult, Model model, @RequestParam("file") MultipartFile image, RedirectAttributes redirectAttributes) {
        newsValidator.validate(news, bindingResult);
        if (bindingResult.hasErrors()) {
            return "add-news";
        }
        newsService.update(news, image);
        redirectAttributes.addFlashAttribute("newsEditSuccess", "News.edit.success");
        return "redirect:/news"  + (news.getProject() != null ? "?projectId=" + news.getProject().getId() : "");
    }

    //-----------------------------------------
    //      УДАЛЕНИЕ НОВОСТЕЙ
    //-----------------------------------------
    //TODO: Метод должен быть DELETE
    @RequestMapping(value = "/delete-news", method = RequestMethod.POST)
    public String deleteNews(Long newsId, RedirectAttributes redirectAttributes) {
        newsService.delete(newsId);
        redirectAttributes.addFlashAttribute("newsDeleteSuccess", "News.delete.success");
        return "redirect:/news";
    }
}
