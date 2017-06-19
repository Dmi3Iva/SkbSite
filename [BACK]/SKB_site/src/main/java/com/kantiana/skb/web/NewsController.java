package com.kantiana.skb.web;

import com.kantiana.skb.model.Comment;
import com.kantiana.skb.model.News;
import com.kantiana.skb.model.Project;
import com.kantiana.skb.service.CommentService;
import com.kantiana.skb.service.NewsService;
import com.kantiana.skb.service.ProjectService;
import com.kantiana.skb.service.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;
import java.util.List;

import static com.kantiana.skb.web.WorkingWithFile.uploadFile;


@Controller
public class NewsController {

    @Autowired
    private NewsService newsService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private ProjectService projectService;

    @Autowired
    private SecurityService securityService;

    //-----------------------------------------
    //      ВСЕ НОВОСТИ
    //-----------------------------------------
    @RequestMapping(value = "/news", method = RequestMethod.GET)
    public String news(Model model, Long projectId) {
        Project project = projectService.findById(projectId);
        if (projectId == null || project == null) {
            model.addAttribute("newsList", newsService.findAllByOrderByTimeOfCreation());
        }
        else {
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
        News news = newsService.findById(newsId);
        model.addAttribute("news", news);
        model.addAttribute("commentsForCurrentNews", commentService.findAllByNewsIdOrderByTimeOfCreation(newsId));
        model.addAttribute("commentForm", new Comment());
        return "news-detailed";
    }

    @RequestMapping(value = "/news-detailed", method = RequestMethod.POST)
    public String newsDetailed(@ModelAttribute("commentForm") Comment commentForm, BindingResult bindingResult, Model model, Long newsId) {
        if (bindingResult.hasErrors()) {
            return "news-detailed";
        }

        //TODO: Доделать функцию сохранения комментариев
        News news = newsService.findById(newsId);
        commentForm.setNews(news);
        commentForm.setAuthor(securityService.findLoggedUser());
        commentForm.setTimeOfCreation(new Timestamp(System.currentTimeMillis()));
        commentService.save(commentForm);

        // Нужно делать редирект вместо возвращения имени jsp,
        // чтобы комментарий отобразился, очистился кэш и всё было хорошо.
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
        }
        model.addAttribute("news", news);
        return "add-news";
    }

    @RequestMapping(value = "/add-news", method = RequestMethod.POST)
    public String addNews(@ModelAttribute("news") News news, BindingResult bindingResult, Model model, Long projectId, @RequestParam("file") MultipartFile file) {
        if (bindingResult.hasErrors()) {
            return "/add-news" + (projectId != null ? "?projectId" + projectId : "");
        }

        // Инициализируем неинициализированные поля
        //TODO: Доделать функцию сохранения новостей
        news.setPhotoPath(uploadFile(file));
        news.setAuthor(securityService.findLoggedUser());
        news.setTimeOfCreation(new Timestamp(System.currentTimeMillis()));
        news.setTimeOfLastUpdate(new Timestamp(System.currentTimeMillis()));
//        news.setProject(null); // пока null
        news.setProject(news.getProject() != null ? projectService.findById(news.getProject().getId()) : null);
        newsService.save(news);

        return "redirect:/news";
    }

    //-----------------------------------------
    //      РЕДАКТИРОВАНИЕ НОВОСТЕЙ
    //-----------------------------------------
    @RequestMapping(value = "/edit-news", method = RequestMethod.GET)
    public String editNews(Model model, Long newsId) {
        News news = newsService.findById(newsId);
        model.addAttribute("news", news);
        if (news.getProject() == null) {
            model.addAttribute("allProjects", projectService.getAllProjects());
        }
        return "add-news";
    }

    @RequestMapping(value = "/edit-news", method = RequestMethod.POST)
    public String editNews(@ModelAttribute("news") News news, BindingResult bindingResult, Model model, @RequestParam("file") MultipartFile file) {
        if (bindingResult.hasErrors()) {
            return "add-news";
        }

        //TODO: Сделать функцию обновления новости
        News oldNews= newsService.findById(news.getId());
        if(oldNews ==null) return "redirect:/news";
        if(file.getSize() > 0)
            oldNews.setPhotoPath(uploadFile(file));
        oldNews.setEditor(securityService.findLoggedUser());
        oldNews.setTimeOfLastUpdate(new Timestamp(System.currentTimeMillis()));
        oldNews.setProject(news.getProject() != null ? projectService.findById(oldNews.getProject().getId()) : null);
        oldNews.setContent(news.getContent());
        oldNews.setName(news.getName());
        newsService.save(oldNews);

        return "redirect:/news";
    }

    //-----------------------------------------
    //      УДАЛЕНИЕ НОВОСТЕЙ
    //-----------------------------------------
    //TODO: Метод должен быть DELETE или POST на крайний случай
    @RequestMapping(value = "/del-news", method = RequestMethod.GET)
    public String editNews(Long newsId) {
        News news = newsService.findById(newsId);
        newsService.delete(news);
        return "redirect:/news";
    }
}
