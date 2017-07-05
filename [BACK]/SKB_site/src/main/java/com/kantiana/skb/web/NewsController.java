package com.kantiana.skb.web;

import com.kantiana.skb.model.*;
import com.kantiana.skb.service.*;
import com.kantiana.skb.validator.CommentValidator;
import com.kantiana.skb.validator.NewsValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
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

    @Autowired
    private CommentValidator commentValidator;

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
    public String newsDetailed(@ModelAttribute("commentForm") Comment commentForm, BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes) {
        commentValidator.validate(commentForm, bindingResult);
        if (bindingResult.hasErrors()) {
            Long newsId = commentForm.getNews().getId();
            model.addAttribute("news", newsService.findById(newsId));
            model.addAttribute("commentsForCurrentNews", commentService.findAllByNewsIdOrderByTimeOfCreation(newsId));
            return "news-detailed";
        }
        commentService.save(commentForm);
        redirectAttributes.addFlashAttribute("commentAddSuccess", "Comment.add.success");
        return "redirect:/news-detailed?newsId=" + commentForm.getNews().getId(); // Нужно делать редирект вместо возвращения имени jsp, чтобы комментарий отобразился, очистился кэш и всё было хорошо.
    }

    //TODO: Метод должен быть DELETE
    @RequestMapping(value = "/delete-comment", method = RequestMethod.POST)
    public String editComment(Long newsId, Long commentId, RedirectAttributes redirectAttributes) {
        commentService.delete(commentId);
        redirectAttributes.addFlashAttribute("commentDeleteSuccess", "Comment.delete.success");
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
            /*for (Role i: logUser.getRoles()){
                if (i.getName().equals("ROLE_ADMIN")){
                    admin = true;
                    break;
                }
            }*/
            if (logUser.getId() != captain.getId() && !admin){
                return "redirect:/error403";
            }
        }
        model.addAttribute("news", news);
        return "add-news";
    }

    @RequestMapping(value = "/add-news", method = RequestMethod.POST)
    public String addNews(@ModelAttribute("news") News news, BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes) {
        newsValidator.validate(news, bindingResult);
        if (bindingResult.hasErrors()) {
            return "add-news";
        }
        newsService.save(news);
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
        if (logUser.getId() != author.getId() &&
            !logUser.getRole().getName().equals("ROLE_MODERATOR") &&
            !logUser.getRole().getName().equals("ROLE_ADMIN")){
            return "redirect:/error403";
        }
        if (news.getProject() == null) {
            model.addAttribute("allProjects", projectService.getAllProjects());
        }
        return "add-news";
    }

    @RequestMapping(value = "/edit-news", method = RequestMethod.POST)
    public String editNews(@ModelAttribute("news") News news, BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes) {
        newsValidator.validate(news, bindingResult);
        if (bindingResult.hasErrors()) {
            return "add-news";
        }
        newsService.update(news);
        redirectAttributes.addFlashAttribute("newsEditSuccess", "News.edit.success");
        return "redirect:/news-detailed?newsId=" + news.getId();
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

    //Динамическое изменение комментария
    @RequestMapping(value = "/news-detailed/edit-comment",
                    method = RequestMethod.POST,
                    headers = {"Content-type=application/json"})
    @ResponseBody
    public  String editComment(@RequestBody ChangingComment changingComment) {
        Comment currentComment = commentService.findById(changingComment.getId());
        currentComment.setContent(changingComment.getContent());
        commentService.save(currentComment);
        return changingComment.getContent();
    }
}
