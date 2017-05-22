package com.kantiana.skb.web;

import com.kantiana.skb.model.Comment;
import com.kantiana.skb.model.News;
import com.kantiana.skb.model.Project;
import com.kantiana.skb.model.User;
import com.kantiana.skb.service.*;
import com.kantiana.skb.validator.UserValidator;
import org.apache.commons.fileupload.FileUpload;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.lang.String;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private NewsService newsService;
    @Autowired
    private ProjectService projectService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private SecurityService securityService;
    @Autowired
    private UserValidator userValidator;

    private static final Logger logger = LoggerFactory.getLogger(FileUpload.class);



    @RequestMapping(value = "/uploadFile", method = RequestMethod.GET)
    public String uploadFilePage(){
        return "uploadFile";
    }
    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    @ResponseBody
    public String uploadFile(@RequestParam("file") MultipartFile file) {// имена параметров (тут - "file") - из формы JSP.

        String name = null;

        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();

                name = file.getOriginalFilename();

                String rootPath = "";
                //Директория
                File dir = new File("image");

                if (!dir.exists()) {
                    dir.mkdirs();
                }

                File uploadedFile = new File(dir.getAbsolutePath() + File.separator + name);
                Random a= new Random();
                while(uploadedFile.exists())
                {
                    uploadedFile = new File(dir.getAbsolutePath() + File.separator + a+ name);
                }
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(uploadedFile));
                stream.write(bytes);
                stream.flush();
                stream.close();

                logger.info("uploaded: " + uploadedFile.getAbsolutePath());

                return "You successfully uploaded file=" + name;

            } catch (Exception e) {
                return "You failed to upload " + name + " => " + e.getMessage();
            }
        } else {
            return "You failed to upload " + name + " because the file was empty.";
        }
    }

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

    //Контроллеры для интграции страниц

    @RequestMapping(value = "/equipment", method = RequestMethod.GET)
    public String equipment() {
        return "equipment";
    }

    @RequestMapping(value = "/equipment-booking", method = RequestMethod.GET)
    public String equipmentBooking() {
        return "equipment-booking";
    }

    @RequestMapping(value = "/equipment-item", method = RequestMethod.GET)
    public String equipmentItem() {
        return "equipment-item";
    }

    @RequestMapping(value = "/index-order", method = RequestMethod.GET)
    public String indexOrder() {
        return "index-order";
    }

    @RequestMapping(value = "/index-student", method = RequestMethod.GET)
    public String indexStudent() {
        return "index-student";
    }

    @RequestMapping(value = "/order", method = RequestMethod.GET)
    public String order() {
        return "order";
    }

    @RequestMapping(value = "/order-detailed", method = RequestMethod.GET)
    public String orderDetailed() {
        return "order-detailed";
    }

    //контроллеры проектов
    @RequestMapping(value = "/projects", method = RequestMethod.GET)
    public String projects(Model model) {
        List<Project> projectsList = projectService.getAllProjects();
        model.addAttribute("projectsList",projectsList);
        return "projects";
    }

    @RequestMapping(value = "/project-detailed", method = RequestMethod.GET)
    public String projectDetailed(Model model, Long id) {
        Project project = projectService.findById(id);
        model.addAttribute("project", project);
        return "project-detailed";
    }

    @RequestMapping(value = {"/add-project","/edit-project"}, method = RequestMethod.GET)
    public String addProject(Model model, Long id) {
        if(id!=null) {
            Project project = projectService.findById(id);
            model.addAttribute("project", project);
        }
        else
            model.addAttribute("project", new Project() );
        return "add-project";
    }

    @RequestMapping(value = "/add-project", method = RequestMethod.POST)
    public String addProject(@ModelAttribute("project") Project project, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "add-project";
        }
        // Инициализируем неинициализированные поля
//        project.setProjectStatus();
//        project.setStatusPercent();
        project.setCaptain(securityService.findLoggedUser());
        project.setDateOfStart(new Date(System.currentTimeMillis()));
        project.setDateOfLastUpdate(new Date(System.currentTimeMillis()));
        project.setAbout(project.getAbout()); // пока null
        project.setName(project.getName());
        projectService.save(project);
        return "redirect:/projects";
    }

    @RequestMapping(value = "/edit-project", method = RequestMethod.POST)
    public String editProject(@ModelAttribute("project") Project project, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "add-project";
        }
        Project oldProject= projectService.findById(project.getId());
        if(oldProject ==null) return "redirect:/project";
        oldProject.setCaptain(securityService.findLoggedUser());
        oldProject.setDateOfLastUpdate(new Date(System.currentTimeMillis()));
        oldProject.setStatusPercent(project.getStatusPercent()); // пока null
        oldProject.setAbout(project.getAbout());
        oldProject.setStatusPercent(project.getStatusPercent());
        oldProject.setProjectStatus(project.getProjectStatus());
        oldProject.setName(project.getName());
        projectService.save(oldProject);
        return "redirect:/projects";
    }


    @RequestMapping(value = "/del-project", method = RequestMethod.GET)
    public String delProject(Long id) {
        Project project = projectService.findById(id);
        projectService.delete(project);
        projectService.delete(id);
        return "redirect:/projects";
    }

    //Контроллер списка новостей
    @RequestMapping(value = "/news", method = RequestMethod.GET)
    public String news(Model model) {
        List<News> newsList= newsService.getAllNews();
        model.addAttribute("newsList", newsList);
        return "news";
    }

    @RequestMapping(value = "/news-detailed", method = RequestMethod.GET)
    public String newsDetailed(Model model, Long newsId) {
        News news = newsService.findById(newsId);
        model.addAttribute("news", news);
        model.addAttribute("commentForm", new Comment());
        return "news-detailed";
    }

    @RequestMapping(value = "/news-detailed", method = RequestMethod.POST)
    public String newsDetailed(@ModelAttribute("commentForm") Comment commentForm, BindingResult bindingResult, Model model, Long newsId) {
        if (bindingResult.hasErrors()) {
            return "news-detailed";
        }
        News news = newsService.findById(newsId);
        commentForm.setNews(news);
        commentForm.setAuthor(securityService.findLoggedUser());
        commentForm.setTimeOfCreation(new Timestamp(System.currentTimeMillis()));
        commentService.save(commentForm);
        model.addAttribute("news", news);
        return "news-detailed";
    }

    //выводит страницу создания и редактирования новости
    @RequestMapping(value = {"/add-news","/edit-news"}, method = RequestMethod.GET)
    public String addNews(Model model, Long newsId) {
        if(newsId!=null) {
            News news = newsService.findById(newsId);
            model.addAttribute("news", news);
        }
        else
            model.addAttribute("news", new News() );
        return "add-news";
    }

    @RequestMapping(value = "/add-news", method = RequestMethod.POST)
    public String addNews(@ModelAttribute("news") News news, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "add-news";
        }
        // Инициализируем неинициализированные поля
        news.setAuthor(securityService.findLoggedUser());
        news.setTimeOfCreation(new Timestamp(System.currentTimeMillis()));
        news.setProject(null); // пока null
        newsService.save(news);
        return "redirect:/news";
    }

    @RequestMapping(value = "/edit-news", method = RequestMethod.POST)
    public String editNews(@ModelAttribute("news") News news, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "add-news";
        }
        News oldNews= newsService.findById(news.getId());
        if(oldNews ==null) return "redirect:/news";
        oldNews.setAuthor(securityService.findLoggedUser());

        oldNews.setTimeOfCreation(new Timestamp(System.currentTimeMillis()));
        oldNews.setProject(null); // пока null
        oldNews.setContent(news.getContent());
        oldNews.setName(news.getName());
        newsService.save(oldNews);
        return "redirect:/news";
    }


    @RequestMapping(value = "/del-news", method = RequestMethod.GET)
    public String editNews(Long newsId) {
        News news = newsService.findById(newsId);
        newsService.delete(news);
        return "redirect:/news";
    }

    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public String aboutPage() {
        return "about";
    }
}
