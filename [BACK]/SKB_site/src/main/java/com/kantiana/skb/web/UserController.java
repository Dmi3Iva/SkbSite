package com.kantiana.skb.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by ZhdanovPasha on 11.04.2017.
 */

@Controller
public class UserController {
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String printHello(Model model) {

        return "index";
    }


}
