package com.kantiana.skb.web;

import com.kantiana.skb.model.*;
import com.kantiana.skb.service.*;
import com.kantiana.skb.web.WorkingWithFile;
import com.kantiana.skb.validator.UserValidator;
import org.apache.commons.fileupload.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.lang.String;
import java.sql.Date;
import java.sql.Timestamp;
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

    private static final Logger logger = LoggerFactory.getLogger(FileUpload.class);

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
        userForm.setPhotoPath("/resources/images/user.jpg");
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
        model.addAttribute("logUser", user);
        return "profile";
    }

    //контроллер для просмотра личного кабинета другого пользователя
    @RequestMapping(value = "/id{id}", method = RequestMethod.GET)
    public String profileUser(@PathVariable Long id, Model model) {
        User user = userService.findById(id);
        String username = securityService.findLoggedInUsername();
        User logUser = userService.findByUsername(username);
        model.addAttribute("user", user);
        model.addAttribute("logUser", logUser);

        return "profile";
    }

    // Контроллер редактирования информации в личном кабинете пользователя
    @RequestMapping(value = "/change-profile{id}", method = RequestMethod.POST)
    public String ChangeUser(@PathVariable Long id,@ModelAttribute("user") User user, BindingResult bindingResult, @RequestParam("file") MultipartFile file) {
        if (bindingResult.hasErrors()) {
            return "profile";
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

        return "redirect:/profile";
    }

    // Контроллер изменения пароля пользователя
    @RequestMapping(value = "/change-password", method = RequestMethod.POST)
    public String changePassword(String currentPassword, String newPassword, String confirmNewPassword){

//        if (currentPassword == null){
//            model.addAttribute("errors", "Введите свой пароль");
//            return "change-profile";
//        }
//
//        if (newPassword == null){
//            model.addAttribute("errors", "Введите новый пароль");
//            return "change-profile";
//        }
//
//        if (confirmNewPassword == null){
//            model.addAttribute("errors", "Подтвердите новый пароль");
//            return "change-profile";
//        }

        User currentUser = securityService.findLoggedUser();
        //currentPassword = userService.encodePassword(currentPassword);

        if (currentPassword == currentUser.getPassword()){
            if (newPassword == confirmNewPassword){
                currentUser.setPassword(newPassword);
                userService.update(currentUser);
                return "redirect:/profile";
            }
            else {
                //model.addAttribute("errors", "Новый пароль не подтвержден");
                return "change-profile";
            }
        }
        else{
            //model.addAttribute("errors", "Введен неверный текущий пароль");
            return "redirect:/change-profile";
        }

        //return "redirect:/profile";
    }

    //Контроллеры для интеграции страниц

    @RequestMapping(value = "/change-profile", method = RequestMethod.GET)
    public String changeProfile(Model model) {
        // Достаём информацию о текущем пользователе и передаём её в .jsp
        User user = securityService.findLoggedUser();
        model.addAttribute("user", user);
        model.addAttribute("passwordChange", new PasswordChange());
        model.addAttribute("error", new String());
        return "change-profile";
    }



}
