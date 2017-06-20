package com.kantiana.skb.web;

import com.kantiana.skb.model.Equipment;
import com.kantiana.skb.model.Request;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashSet;
import java.util.Set;

@Controller
@SessionAttributes(types = Request.class)
public class EquipmentBookingController {

    @RequestMapping(value = "/booking-", method = RequestMethod.POST)
    public ModelAndView sessionEquipmentBasket(@ModelAttribute Set<Equipment> basket)
    {
        ModelAndView modelAndView = new ModelAndView("equipment-basket");
        modelAndView.addObject(basket);
        return modelAndView;
    }
}
