package com.kantiana.skb.web;

import com.kantiana.skb.model.Equipment;
import com.kantiana.skb.model.EquipmentType;
import com.kantiana.skb.service.EquipmentTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

import static com.kantiana.skb.web.WorkingWithFile.uploadFile;

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

    @RequestMapping(value = "/add-equipment-type", method = RequestMethod.POST)
    public  String equipmentTypeAddPost(@ModelAttribute("equipmnetType") EquipmentType equipmentType, BindingResult bindingResult, Model model, @RequestParam("file")MultipartFile file)
    {
        if(bindingResult.hasErrors())
        {
            return "add-equipment-type";
        }
        if (file.getSize()>0)
            equipmentType.setPhotoPath(uploadFile(file));
        equipmentTypeService.save(equipmentType);
        return "redirect:/equipment";
    }

    @RequestMapping(value = "/del-equipment-type", method = RequestMethod.GET)
    public String delEquipmentType(Long id) {
        equipmentTypeService.delete(id);
        return "redirect:/equipment";
    }

    @RequestMapping(value = "/equipment-booking", method = RequestMethod.GET)
    public String equipmentBooking() {
        return "equipment-booking";
    }

    @RequestMapping(value = "/equipment-item", method = RequestMethod.GET)
    public String equipmentItem() {
        return "equipment-item";
    }
}
