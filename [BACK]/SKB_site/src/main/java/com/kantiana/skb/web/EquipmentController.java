package com.kantiana.skb.web;

import com.kantiana.skb.model.*;
import com.kantiana.skb.service.*;
import com.kantiana.skb.validator.EquipmentTypeValidator;
import com.sun.org.apache.xpath.internal.operations.Mod;
import jdk.nashorn.internal.ir.RuntimeNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.management.openmbean.ArrayType;
import java.lang.reflect.Type;
import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.*;
import java.util.Date;

import static com.kantiana.skb.web.WorkingWithFile.uploadFile;

@Controller
@SessionAttributes("basket")
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
    @Autowired
    private EquipmentTypeValidator equipmentTypeValidator;

    @ModelAttribute("basket")
    public Set<EquipmentType> createBasket(){
        return new HashSet<EquipmentType>();
    }

    @RequestMapping(value = "/equipment", method = RequestMethod.GET)
    public String equipment(Model model, @ModelAttribute("basket") Set<EquipmentType> basket )
    {
        User logUser = securityService.findLoggedUser();
        model.addAttribute("logUser", logUser);

        List<EquipmentType> equipmentTypeList = equipmentTypeService.getAllEquipmentType();
        model.addAttribute("equipmentTypeList",equipmentTypeList);

        if(!model.containsAttribute("basket"))
            model.addAttribute("basket", new HashSet<EquipmentType>());

        return "equipment";
    }


    @RequestMapping(value = {"/add-equipment-type", "/edit-equipment-type"}, method = RequestMethod.GET)
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
    public  String equipmentTypeAddPost(@ModelAttribute("equipmentType") EquipmentType equipmentType, BindingResult bindingResult, Model model, @RequestParam("file")MultipartFile file, RedirectAttributes redirectAttributes)
    {
        equipmentTypeValidator.validate(equipmentType, bindingResult);
        if (bindingResult.hasErrors())
        {
            return "add-equipment-type";
        }
        if (file.getSize()>0)
            equipmentType.setPhotoPath(uploadFile(file));
        equipmentTypeService.save(equipmentType);
        redirectAttributes.addFlashAttribute("equipmentTypeAddSuccess", "EquipmentType.add.success");
        return "redirect:/equipment";
    }

    @RequestMapping(value = "/edit-equipment-type", method = RequestMethod.POST)
    public  String equipmentTypeEditPost(@ModelAttribute("equipmentType") EquipmentType equipmentType, BindingResult bindingResult, Model model, @RequestParam("file")MultipartFile file, RedirectAttributes redirectAttributes)
    {
        equipmentTypeValidator.validate(equipmentType, bindingResult);
        if (bindingResult.hasErrors())
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
        redirectAttributes.addFlashAttribute("equipmentTypeEditSuccess", "EquipmentType.edit.success");
        return "redirect:/equipment-type-detailed?id=" + equipmentType.getId();
    }

    //TODO: Метод должен быть DELETE или по крайней мере POST
    @RequestMapping(value = "/del-equipment-type", method = RequestMethod.GET)
    public String delEquipmentType(Long id, RedirectAttributes redirectAttributes) {
        equipmentTypeService.delete(id);
        redirectAttributes.addFlashAttribute("equipmentTypeDeleteSuccess", "EquipmentType.delete.success");
        return "redirect:/equipment";
    }

    @RequestMapping(value = "/equipment-type-detailed", method = RequestMethod.GET)
    public String equipmentDetailed( Long id,Model model,@ModelAttribute("basket") Set<EquipmentType> basket, @ModelAttribute EquipmentType equipmentToBasket) {
        EquipmentType equipmentType = equipmentTypeService.findById(id);
        if(basket ==null) basket = new HashSet<EquipmentType>();
        model.addAttribute("equipmentType",equipmentType);
        model.addAttribute("equipment", new Equipment());
        if(!model.containsAttribute("basket"))
            model.addAttribute("basket", new HashSet<EquipmentType>());
        model.addAttribute("equipmentToBasket", equipmentToBasket);
        return "equipment-type-detailed";
    }

    @RequestMapping(value = "/equipment-type-detailed", method = RequestMethod.POST)
    public String equipmentPostDetailed( Long id,Model model, @ModelAttribute("basket") Set<EquipmentType> basket) {

        for(EquipmentType e : basket){
            if(e.getId()== id )return "redirect:/equipment-type-detailed?id="+id;
        }
        basket.add(equipmentTypeService.findById(id));
        return "redirect:/equipment-type-detailed?id="+id;
    }

    @RequestMapping(value = "/equipment-table-{idType}", method = RequestMethod.POST)
    public  String addEquipment(@ModelAttribute("equipment") Equipment equipment, BindingResult bindingResult, @PathVariable Long idType,@ModelAttribute Request request)
    {
        if(bindingResult.hasErrors())
        {
            return "redirect:/equipment-table-"+ idType;
        }
        equipment.setEquipmentType(equipmentTypeService.findById(idType));
        equipmentService.save(equipment);
        return "redirect:/equipment-table-"+ idType;
    }

    @RequestMapping(value = "/equipment-booking", method = RequestMethod.GET)
    public String equipmentBooking(Model model, Long idType, @ModelAttribute("basket") Set<EquipmentType> basket,
                                   @ModelAttribute("RequestEquipment") RequestEquipment requestEquipment) {
        if(requestEquipment == null)
        {
            requestEquipment = new RequestEquipment();
        }

        if(requestEquipment.getSize() == 0)
        {
            for(EquipmentType e : basket)
            {
                requestEquipment.add(e.getId(),1L, e.getName());
            }
        }

        if(!model.containsAttribute("requestEquipment"))
        {
            model.addAttribute("requestEquipment", requestEquipment);
        }

        return "equipment-booking";
    }

    @RequestMapping(value = "/equipment-booking", method = RequestMethod.POST)
    public String equipmentBookingPost(Model model, @ModelAttribute RequestEquipment requestEquipment) throws ParseException {
        //Формируем отрезки времени
        int timeMask=0;
        Map<String,Integer> timeMap = new HashMap<String,Integer>();

        List<String> timeChoose = requestEquipment.getTimeChoose();
        List<String> timeList = requestEquipment.getTimeList();

        int i = 0 ;
        for (String s: timeList){
            timeMap.put( s, i );
            ++ i ;
        }
        for (String s: timeChoose) {
            timeMask= timeMask | (1<<timeMap.get(s));
        }

        //
        Request request = new Request();
        request.setUser(securityService.findLoggedUser());
        requestService.save(request);

        //Формириуем bookings
        List<EquipmentTypeCount> equipmentTypeCountList = requestEquipment.getEquipmentTypeCountList();
        Booking booking = null;
        for (EquipmentTypeCount equipmentTypeCount:
             equipmentTypeCountList) {
            EquipmentType equipmentType = equipmentTypeService.findById(equipmentTypeCount.getId());
            Set<Equipment> equipmentSet = equipmentType.getEquipmentSet();
            i = 0;
            if( equipmentSet.size() < equipmentTypeCount.getCount())
                return "equipment-booking";
            for (Equipment e: equipmentSet) {
                if( i >=  equipmentTypeCount.getCount()) {
                    break;
                }
                booking = new Booking();
                booking.setRequest(request);
                //Преобразуем Date
                DateFormat format = new SimpleDateFormat("dd.MM.yyyy");
                try {
                    java.util.Date utilDate = format.parse(requestEquipment.getDate());
                    java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
                    booking.setDay(sqlDate);
                }
                catch (Exception ex) {}
                booking.setEquipment(e);
                booking.setTimeMask(timeMask);
                bookingService.save(booking);
                i++;
            }
        }
        return "equipment";
    }

    @RequestMapping(value = "/equipment-table-{idType}", method = RequestMethod.GET)
    public String equipmentTable(@PathVariable Long idType, Model model) {
        EquipmentType equipmentType = equipmentTypeService.findById(idType);
        model.addAttribute("equipmentSet", (equipmentType!=null) ? equipmentService.findAllByEquipmentTypeIdOrderById(idType) : null);
        model.addAttribute("equipmentType",equipmentType);
        model.addAttribute("equipment", new Equipment());
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
