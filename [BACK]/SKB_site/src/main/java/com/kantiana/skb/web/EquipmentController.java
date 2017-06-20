package com.kantiana.skb.web;

import com.kantiana.skb.model.*;
import com.kantiana.skb.service.*;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import static com.kantiana.skb.web.WorkingWithFile.uploadFile;

@Controller
public class EquipmentController {
    @Autowired
    private EquipmentTypeService equipmentTypeService;
    @Autowired
    private EquipmentService equipmentService;
    @Autowired
    private BookingService bookingService;
    @Autowired
    private SecurityService securityService;
    @Autowired
    private RequestService requestService;

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

    @RequestMapping(value = "/equipment-table-{idType}", method = RequestMethod.POST)
    public  String addEquipment(@ModelAttribute("equipment") Equipment equipment, BindingResult bindingResult, @PathVariable Long idType)
    {
        if(bindingResult.hasErrors())
        {
            return "redirect:/equipment-table-"+ idType;
        }
        equipment.setEquipmentType(equipmentTypeService.findById(idType));
        equipmentService.save(equipment);
        return "redirect:/equipment-table-{idType}";
    }

    @RequestMapping(value = "/equipment-booking", method = RequestMethod.GET)
    public String equipmentBooking(Model model, Long idType) {
        model.addAttribute("easyTime",new EasyTime());

        return "equipment-booking";
    }

    @RequestMapping(value = "/equipment-booking", method = RequestMethod.POST)
    public String equipmentBookingPost(Model model, Long idType, @ModelAttribute EasyTime easyTime) {
        Booking booking= new Booking();
        easyTime.makeSecond();
        booking.setBegin(Timestamp.valueOf(easyTime.getBegin().replace("T"," ")));
        booking.setEnd(Timestamp.valueOf(easyTime.getEnd().replace("T"," ")));
        EquipmentType equipmentType = equipmentTypeService.findById(idType);
        Set<Equipment> equipmentSet= equipmentType.getEquipmentSet();
        Equipment equipment = null;
        for (Equipment e:equipmentSet
             ) {
            if(e.getBooking()==null) {
                equipment = e;
                break;
            }
        }
        if (equipment ==null)
            return "equipment-booking";
        booking.setEquipment(equipment);
        Request request = new Request();
        Set<Booking> bookings = new HashSet<Booking>();
        bookings.add(booking);
        request.setBookingSet(bookings);
        request.setUser(securityService.findLoggedUser());
        booking.setRequest(request);
        bookingService.save(booking);
        requestService.save(request);
        return "equipment-booking";
    }

    @RequestMapping(value = "/equipment-table-{idType}", method = RequestMethod.GET)
    public String equipmentTable(@PathVariable Long idType, Model model) {
        EquipmentType equipmentType = equipmentTypeService.findById(idType);
        model.addAttribute("equipmentSet", (equipmentType!=null) ? equipmentService.findAllByEquipmentTypeIdOrderById(idType) : null);
        model.addAttribute("equipmentType",equipmentType);
        model.addAttribute("equipment", new Equipment());
        model.addAttribute("equipmentItem", new Equipment());
        model.addAttribute("equipmentDelete", new Equipment());
        return "equipment-table";
    }

    @RequestMapping(value = "/edit-equipment-table", method = RequestMethod.POST)
    public String editEquipmentTable(Long idEquip, String uniqueNumber) {
        Equipment equipment = equipmentService.findById(idEquip);
        equipment.setUniqueNumber(uniqueNumber);
        equipmentService.save(equipment);
        return "redirect://equipment-table-"+equipment.getEquipmentType().getId();
    }

    @RequestMapping(value = "/del-equipment-table", method = RequestMethod.POST)
    public String delEquipmentTable(Long idEquip) {
        Long idType = equipmentService.findById(idEquip).getEquipmentType().getId();
        equipmentService.deleteById(idEquip);
        return "redirect://equipment-table-"+idType;
    }
}
