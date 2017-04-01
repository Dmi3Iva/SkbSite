package com.hellokoding.account.web;

import com.hellokoding.account.model.User;
import com.hellokoding.account.service.SecurityService;
import com.hellokoding.account.service.UserService;
import com.hellokoding.account.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import java.util.List;


@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/welcome";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    //сервлет, возвращающий JSP welcome
    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model) {

        model.addAttribute("userList", getUsers());

        // Добавляем в модель атрибут photoPath (атрибуты модели будут использоваться в welcome.jsp)
        model.addAttribute("photoPath", getPhotoPath());

        // для отладки
        //model.addAttribute("stringUserList", fake());

        return "welcome";
    }

    //сервлет, который возвращает название фотографии текущего пользователя
    @RequestMapping(value = "/welcome/getPhotoPath", method = RequestMethod.GET)
    public @ResponseBody String getPhotoPath() {
        // Какой-то поток обрабатывает данный запрос
        // В его контексте лежит информация о зашедшем пользователе
        // Ниже она и достаётся
        Authentication a = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails;
        String photoPath = "";

        if (a.getPrincipal() instanceof UserDetails) {
            userDetails = (UserDetails)a.getPrincipal();
            // Достаём пользователя из базы данных
            User user = userService.findByUsername(userDetails.getUsername());

            // Если у пользователя нет фотки, т.е. photoPath == null, программа работает корректно
            photoPath = user.getPhotoPath();
        }
        if (photoPath == null) {
            photoPath = "default.jpg";
        }

        return photoPath;
    }

    //сервлет, который возвращает список юзеров
    @RequestMapping(value = "/welcome/getUsers", method = RequestMethod.GET)
    public @ResponseBody List<User> getUsers() {
        List<User> userList = userService.getAll();
        return userList;
    }

    //отладка для обновления таблицы пользователей
    /*@RequestMapping(value = "/welcome/fake", method = RequestMethod.GET)
    public @ResponseBody String fake() {
        List<User> userList = userService.getAll();
        User[] users = new User[userList.size()];
        for (int i = 0 ; i < userList.size(); i++){
            users[i] = userList.get(i);
        }
        String res = "[";
        for (int i = 0 ; i < userList.size(); i++){
            String current = "[";
            current += "\"" + userList.get(i).getId().toString() + "\", " ;
            current += "\"" + userList.get(i).getUsername().toString() + "\", ";
            current += "\"" + userList.get(i).getPassword().toString() + "\", ";
            current += "\"" + userList.get(i).getPassword().toString() + "\"";
            current += "]";
            res +=current;
            if (i == userList.size()-1) res+=']';
            else res+=", ";
        }
        return res;
    }*/

}
