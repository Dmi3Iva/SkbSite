package com.kantiana.skb.web;

import com.kantiana.skb.model.*;
import com.kantiana.skb.service.*;
import com.kantiana.skb.validator.UserValidatorImpl;
import org.apache.commons.fileupload.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.lang.String;
import java.util.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    private UserValidatorImpl userValidator;
    @Autowired
    private ProjectMembershipService projectMembershipService;
    @Autowired
    private MailService mailService;
    @Autowired
    private MessageService messageService;

    private static final Logger logger = LoggerFactory.getLogger(FileUpload.class);

    // Контроллер главной страницы
    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public String index(Model model, String logout, String login) {
        // Передаём в index.jsp все новости
        List<News> news = newsService.findTop(2);
        model.addAttribute("news", news);
        List<Project> projects = projectService.getAllProjects();
        model.addAttribute("projects", projects);
        if (logout != null) {
            model.addAttribute("logoutMessage", "LogoutMessage");
        }
        else if (login != null) {
            model.addAttribute("loginMessage", "LoginMessage");
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
        userValidator.validateRegistration(userForm, bindingResult);
        if (bindingResult.hasErrors()) {
            return "registration";
        }
        userForm.setPhotoPath("/resources/images/user.jpg");
        userService.save(userForm);
        securityService.login(userForm.getUsername(), userForm.getPasswordConfirm());
        return "redirect:/";
    }

    // Контроллер страницы входа
    @RequestMapping(value = "/authorization", method = RequestMethod.GET)
    public String authorization(Model model, String error) {
        if (error != null) {
            model.addAttribute("loginErrorCode", "Login.error");
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

    @RequestMapping(value = "/change-profile", method = RequestMethod.GET)
    public String changeProfile(Model model, RedirectAttributes redirectAttributes) {
        User user = securityService.findLoggedUser();
        model.addAttribute("user", user);
        model.addAttribute("error", new String());
        return "change-profile";
    }

    // Контроллер редактирования информации в личном кабинете пользователя
    @RequestMapping(value = "/change-profile{id}", method = RequestMethod.POST)
    public String changeUser(@PathVariable Long id, @ModelAttribute("user") User user, BindingResult bindingResult, @RequestParam("file") MultipartFile file) {
        userValidator.validateChange(user, bindingResult);
        if (bindingResult.hasErrors()) {
            return "change-profile";
        }

        User oldUser= userService.findById(id);

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

        if (file.getSize()>0)
            oldUser.setPhotoPath(uploadFile(file));

        userService.update(oldUser);
        securityService.relogin(oldUser.getUsername(), oldUser.getPassword());

        return "redirect:/profile";
    }

    // Контроллер изменения пароля пользователя
    @RequestMapping(value = "/change-password", method = RequestMethod.POST)
    public String changePassword(String currentPassword, String newPassword, String confirmNewPassword, RedirectAttributes redirectAttributes){
        Map<String, String> errors = new HashMap<>();
        userValidator.validatePasswordChange(currentPassword, newPassword, confirmNewPassword, errors);
        if (!errors.isEmpty()) {
            redirectAttributes.addFlashAttribute("passwordChangeErrors", errors);
            return "redirect:/change-profile";
        }
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        User currentUser = securityService.findLoggedUser();

        currentUser.setPassword(passwordEncoder.encode(newPassword));
        userService.update(currentUser);

        return "redirect:/profile";
    }

    @RequestMapping(value = "/forget-password", method = RequestMethod.GET)
    public String forgetPassword(Model model) {
        model.addAttribute("user", new User());
        return "forget-password";
    }

    @RequestMapping(value = "/forget-password", method = RequestMethod.POST)
    public String forgetPassword(@ModelAttribute("user") User userForm, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        userValidator.validateForgetPassword(userForm, bindingResult);
        if (bindingResult.hasErrors()) {
            return "forget-password";
        }
        User user = userService.findByUsername(userForm.getUsername());
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String newPassword = userService.generatePassword();
        user.setPassword(passwordEncoder.encode(newPassword));
        userService.update(user);
        mailService.sendNewPassword(user.getUsername(), newPassword, user.getEmail());
        Object[] arg = {user.getEmail()};
        redirectAttributes.addFlashAttribute(
                "emailPasswordSuccess",
                messageService.getMessage("Email.password.success", user.getEmail())
        );
        return "redirect:/authorization";
    }

    //Контроллер для страницы с ошибкой доступа
    @RequestMapping(value = "/error403", method = RequestMethod.GET)
    public String error403(){
        return "error403";
    }
}
