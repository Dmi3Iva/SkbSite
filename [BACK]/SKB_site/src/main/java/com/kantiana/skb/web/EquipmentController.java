package com.kantiana.skb.web;

import com.kantiana.skb.model.EquipmentType;
import com.kantiana.skb.service.EquipmentTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class EquipmentController {
    @Autowired
    private EquipmentTypeService equipmentTypeService;

    @RequestMapping(value = "/equipment", method = RequestMethod.GET)
    public String equipment(Model model)
    {
        List<EquipmentType> equipmentTypeList = equipmentTypeService.getAllEquipmentType();
        model.addAttribute("equipmentTypeList",equipmentTypeList);
        return "equipment";
    }

    @RequestMapping(value = "/add-equipment-type", method = RequestMethod.GET)
    public  String equipmentTypeAddGet(Model model, Long equipmentTypeId)
    {
        model.addAttribute("equipmentType", new EquipmentType());
        return "add-equipment-type";
    }
//
//    @RequestMapping(value = "/add-equipment-type", method = RequestMethod.GET)
//    public  String equipmentTypeAddPost(Model model)
//    {
//        return "add-equipment-type";
//    }

    @RequestMapping(value = "/equipment-booking", method = RequestMethod.GET)
    public String equipmentBooking() {
        return "equipment-booking";
    }

    @RequestMapping(value = "/equipment-item", method = RequestMethod.GET)
    public String equipmentItem() {
        return "equipment-item";
    }
}
