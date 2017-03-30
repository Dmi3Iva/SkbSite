package com.hellokoding.account.web;

import com.hellokoding.account.model.User;
import com.hellokoding.account.repository.UserRepository;
import com.hellokoding.account.service.SecurityService;
import com.hellokoding.account.service.UserDetailsServiceImpl;
import com.hellokoding.account.service.UserService;
import com.hellokoding.account.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.constraints.Max;
import javax.xml.soap.Name;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    /*@Autowired
    UserRepository userRepository;

    @RequestMapping(method = RequestMethod.GET)
    public List<User> getAll() {
        return userRepository.findAll();
    }*/

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

    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model) {
        // Какой-то поток обрабатывает данный запрос
        // В его контексте лежит информация о зашедшем пользователе
        // Ниже она и достаётся
        Authentication a = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails;
        String photoPath = "";

        // Работа со списком пользователей
        /*LinkedList<myUser> userList = new LinkedList<myUser>();
        userList.add(new myUser("Ivan",  13L));
        userList.add(new myUser("Misha",  228L));*/

        //model.addAttribute("userList", userList);



        List<User> userList = userService.getAll();
        model.addAttribute("userList", userList);

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

        // Добавляем в модель атрибут photoPath (атрибуты модели будут использоваться в welcome.jsp)
        model.addAttribute("photoPath", photoPath);

        return "welcome";
    }

    //это налр == удалить
    /*public class myUser{
        private String name ;
        private Long id;

        public myUser(String name, Long id){
            this.name = name;
            this.id = id;
        }

        public String getName(){
            return this.name;
        }

        public Long getId(){
            return this.id;
        }

    }*/

}
