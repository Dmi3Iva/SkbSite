package com.kantiana.skb.web;

import com.kantiana.skb.model.*;
import com.kantiana.skb.service.*;
import com.kantiana.skb.validator.UserValidator;
import org.apache.commons.fileupload.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.lang.String;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import static com.kantiana.skb.web.WorkingWithFile.uploadFile;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private NewsService newsService;
    @Autowired
    private ProjectService projectService;
    @Autowired
    private SecurityService securityService;
    @Autowired
    private UserValidator userValidator;
    @Autowired
    private ProjectMembershipService projectMembershipService;
    @Autowired
    private MailService mailService;
    @Autowired
    private RoleService roleService;

    private static final Logger logger = LoggerFactory.getLogger(FileUpload.class);

    // Контроллер главной страницы
    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public String index(Model model, String logout) {
        // Передаём в index.jsp все новости
        List<News> news = newsService.findTop(2);
        model.addAttribute("news", news);
        List<Project> projects = projectService.findTop(2);
        model.addAttribute("projects", projects);
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
        userForm.setPhotoPath("/resources/images/user.jpg");
        userService.save(userForm);
        securityService.login(userForm.getUsername(), userForm.getPasswordConfirm());
        return "redirect:/";
    }

    //TODO: Сообщения об ошибках и другие не должны быть в коде
    // Контроллер страницы входа
    @RequestMapping(value = "/authorization", method = RequestMethod.GET)
    public String authorization(Model model, String success, String error) {
        if (error != null) {
            model.addAttribute("error", "Ваше имя и пароль не действительны.");
        }
        if (success != null) {
            model.addAttribute("success", "Письмо с новым паролем отправлено на Вашу почту");
        }
        return "authorization";
    }

    // Контроллер личного кабинета
    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String profile(Model model) {
        User user = securityService.findLoggedUser();
        if (user == null) {
            return "redirect:/";
        }
        model.addAttribute("user", user);
        model.addAttribute("logUser", user);
        model.addAttribute("userProjects", projectMembershipService.findProjectsWhereUserIsMember(user.getId()));
        return "profile";
    }

    //контроллер для просмотра личного кабинета другого пользователя
    @RequestMapping(value = "/id{id}", method = RequestMethod.GET)
    public String profileUser(@PathVariable Long id, Model model) {
        User user = userService.findById(id);
        User logUser = securityService.findLoggedUser();
        model.addAttribute("user", user);
        model.addAttribute("logUser", logUser);
        model.addAttribute("userProjects", projectMembershipService.findProjectsWhereUserIsMember(user.getId()));
        return "profile";
    }

    // Контроллер редактирования информации в личном кабинете пользователя
    @RequestMapping(value = "/change-profile{id}", method = RequestMethod.POST)
    public String changeUser(@PathVariable Long id, @ModelAttribute("user") User user, BindingResult bindingResult, Model model, @RequestParam("file") MultipartFile file) {
        if (bindingResult.hasErrors()) {
            return "change-profile";
        }

        User oldUser = userService.findById(id);
        String oldName = oldUser.getUsername();

        oldUser.setEmail(user.getEmail());
        oldUser.setDateOfBirth(user.getDateOfBirth());
        oldUser.setAbout(user.getAbout());
        oldUser.setFirstName(user.getFirstName());
        oldUser.setLastName(user.getLastName());
        oldUser.setMiddleName(user.getMiddleName());
        oldUser.setContactDetails(user.getContactDetails());
        oldUser.setGithub(user.getGithub());
        oldUser.setOrganization(user.getOrganization());
        oldUser.setUsername(user.getUsername());
        if (!oldUser.isChecked()) {
            oldUser.setChecked(user.isChecked());
        }
        oldUser.setModerator(user.isModerator());
        userService.update(oldUser);
        if (oldName.equals(securityService.findLoggedInUsername())) {
            securityService.relogin(oldUser.getUsername(), oldUser.getPassword());
        }

        return "redirect:/id" + oldUser.getId();
    }

    // Контроллер изменения пароля пользователя
    @RequestMapping(value = "/change-password", method = RequestMethod.POST)
    public String changePassword(String currentPassword, String newPassword, String confirmNewPassword){
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        User currentUser = securityService.findLoggedUser();

        //TODO: Сделать вывод ошибок
        if (currentPassword == null || newPassword == null || confirmNewPassword == null) {
            // Если писать return "change-profile", то будет ругаться spring-bind в jsp
            return "redirect:/change-profile";
        }
        if (!passwordEncoder.matches(currentPassword, currentUser.getPassword())) {
            return "redirect:/change-profile";
        }
        if (!newPassword.equals(confirmNewPassword)) {
            return "redirect:/change-profile";
        }

        currentUser.setPassword(passwordEncoder.encode(newPassword));
        userService.update(currentUser);

        return "redirect:/id" + currentUser.getId();
    }

    //Контроллеры для интеграции страниц

    @RequestMapping(value = "/change-profile", method = RequestMethod.GET)
    public String changeProfile(Model model) {
        User user = securityService.findLoggedUser();
        model.addAttribute("user", user);
        model.addAttribute("error", new String());
        return "change-profile";
    }

    @RequestMapping(value = "/change-profile{id}", method = RequestMethod.GET)
    public String changeProfileById(@PathVariable Long id, Model model) {
        User user = userService.findById(id);
        User loggedUser = securityService.findLoggedUser();
        if (user.getRole().getName().equals(roleService.getRoleModerator().getName())){
            user.setModerator(true);
        }
        model.addAttribute("user", user);
        model.addAttribute("loggedUser", loggedUser);
        model.addAttribute("error", new String());
        return "change-profile";
    }


    @RequestMapping(value = "/forget-password", method = RequestMethod.GET)
    public String forgetPassword(Model model, String error) {
        if (error != null) {
            model.addAttribute("error", "Пользователя с таким именем не существует.");
        }
        return "forget_password";
    }

    @RequestMapping(value = "/forget-password", method = RequestMethod.POST)
    public String forgetPassword(String username) {
        User user = userService.findByUsername(username);
        if (user == null) {
            return "redirect:/forget-password?error";
        }
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String newPassword = userService.generatePassword();
        user.setPassword(passwordEncoder.encode(newPassword));
        userService.update(user);
        mailService.sendNewPassword(username, newPassword, user.getEmail());
        return "redirect:/authorization?success";
    }

    //Контроллер для страницы с ошибкой доступа
    @RequestMapping(value = "/error403", method = RequestMethod.GET)
    public String error403(){
        return "error403";
    }

    //Контроллер для модерации конетнта на сайте
    @RequestMapping(value = "/moderation", method = RequestMethod.GET)
    public String moderation(Model model){
        User user = securityService.findLoggedUser();
        if (user.getRole().getId() == roleService.getRoleMember().getId() ||
            user.getRole().getId() == roleService.getRoleCustomer().getId()){
            return "redirect:/error403";
        }
        List<User> usersChecked = userService.findByChecked(true);
        List<User> usersUnchecked = userService.findByChecked(false);
        List<News> newsChecked = newsService.findByChecked(true);
        List<News> newsUnchecked = newsService.findByChecked(false);
        List<Project> projectsChecked = projectService.findByChecked(true);
        List<Project> projectsUnchecked = projectService.findByChecked(false);


        model.addAttribute("usersChecked", usersChecked);
        model.addAttribute("usersUnchecked", usersUnchecked);
        model.addAttribute("newsChecked", newsChecked);
        model.addAttribute("newsUnchecked", newsUnchecked);
        model.addAttribute("projectsChecked", projectsChecked);
        model.addAttribute("projectsUnchecked", projectsUnchecked);
        return "moderation";
    }

}
