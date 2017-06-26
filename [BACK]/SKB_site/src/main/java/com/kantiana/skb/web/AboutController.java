package com.kantiana.skb.web;

import com.kantiana.skb.model.AboutPage;
import com.kantiana.skb.model.User;
import com.kantiana.skb.service.AboutPageService;
import com.kantiana.skb.service.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AboutController {

    @Autowired
    private SecurityService securityService;

    @Autowired
    private AboutPageService aboutPageService;

    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public String aboutPageGet(Model model) {
        AboutPage aboutPage = aboutPageService.getPage();
        if(aboutPage ==null ) aboutPage= new AboutPage();
        model.addAttribute("aboutPage", aboutPage);
        return "about";
    }


    @RequestMapping(value = "/about", method = RequestMethod.POST)
    public String aboutPagePost(Model model, @ModelAttribute AboutPage aboutPage) {
        aboutPageService.save(aboutPage);
        return "redirect:/about";
    }
}
