package com.kantiana.skb.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import java.util.List;
/**
 * Created by ZhdanovPasha on 06.04.2017.
 */
@Controller
public class UserController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String dispatcher(Model model) {

        return "main";
    }
}
