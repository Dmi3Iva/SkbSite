package com.kantiana.skb.web;

import com.kantiana.skb.model.Equipment;
import com.kantiana.skb.model.EquipmentType;
import com.kantiana.skb.service.EquipmentService;
import com.kantiana.skb.service.EquipmentTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

import static com.kantiana.skb.web.WorkingWithFile.uploadFile;

@Controller
public class EquipmentController {
    @Autowired
    private EquipmentTypeService equipmentTypeService;
    @Autowired
    private EquipmentService equipmentService;

    @RequestMapping(value = "/equipment", method = RequestMethod.GET)
    public String equipment(Model model)
    {
        List<EquipmentType> equipmentTypeList = equipmentTypeService.getAllEquipmentType();
        model.addAttribute("equipmentTypeList",equipmentTypeList);
        return "equipment";
    }

    @RequestMapping(value = {"/add-equipment-type","/edit-equipment-type"}, method = RequestMethod.GET)
    public  String equipmentTypeAddGet(Model model, Long id)
    {
        if(id != null)
        {
            EquipmentType equipmentType = equipmentTypeService.findById(id);
            model.addAttribute("equipmentType", equipmentType);
        }
        else
        {
            model.addAttribute("equipmentType", new EquipmentType());
        }
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

    @RequestMapping(value = "/edit-equipment-type", method = RequestMethod.POST)
    public  String equipmentTypeEditPost(@ModelAttribute("equipmnetType") EquipmentType equipmentType, BindingResult bindingResult, Model model, @RequestParam("file")MultipartFile file)
    {
        if(bindingResult.hasErrors())
        {
            return "add-equipment-type";
        }
        EquipmentType et= equipmentTypeService.findById(equipmentType.getId());
        if(et == null) return "redirect:/equipment";
        et.setAbout(equipmentType.getAbout());
        et.setEquipmentSet(equipmentType.getEquipmentSet());
        et.setFeatures(equipmentType.getFeatures());
        et.setName(equipmentType.getName());

        if (file.getSize()>0)
            et.setPhotoPath(uploadFile(file));
        equipmentTypeService.save(et);
        return "redirect:/equipment";
    }

    @RequestMapping(value = "/del-equipment-type", method = RequestMethod.GET)
    public String delEquipmentType(Long id) {
        equipmentTypeService.delete(id);
        return "redirect:/equipment";
    }

    @RequestMapping(value = "/equipment-type-detailed", method = RequestMethod.GET)
    public String newsDetailed( Long id,Model model) {
        EquipmentType equipmentType = equipmentTypeService.findById(id);
        model.addAttribute("equipmentType",equipmentType);
        model.addAttribute("equipment", new Equipment());
        return "equipment-type-detailed";
    }

    @RequestMapping(value = "/equipment-type-detailed{idType}", method = RequestMethod.POST)
    public  String addEquipment(@ModelAttribute("equipment") Equipment equipment, BindingResult bindingResult, @PathVariable Long idType)
    {
        if(bindingResult.hasErrors())
        {
            return "redirect:/equipment-type-detailed?id="+idType;
        }
        equipment.setEquipmentType(equipmentTypeService.findById(idType));
        equipmentService.save(equipment);
        return "redirect:/equipment-type-detailed?id="+idType;
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
