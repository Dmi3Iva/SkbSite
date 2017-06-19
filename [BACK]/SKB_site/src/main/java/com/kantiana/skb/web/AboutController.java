package com.kantiana.skb.web;

import com.kantiana.skb.model.User;
import com.kantiana.skb.service.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AboutController {

    @Autowired
    private SecurityService securityService;

    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public String aboutPage(Model model) {
        User logUser = securityService.findLoggedUser();
        model.addAttribute("logUser", logUser);
        return "about";
    }

}
