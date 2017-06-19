package com.kantiana.skb.web;

import com.kantiana.skb.model.Comment;
import com.kantiana.skb.model.Order;
import com.kantiana.skb.model.User;
import com.kantiana.skb.service.OrdersService;
import com.kantiana.skb.service.ProjectService;
import com.kantiana.skb.service.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;
import java.util.List;

import static com.kantiana.skb.web.WorkingWithFile.uploadFile;

@Controller
public class OrdersController {

    @Autowired
    private OrdersService ordersService;
    @Autowired
    private SecurityService securityService;
    @Autowired
    private ProjectService projectService;

    //Контроллер списка новостей
    @RequestMapping(value = "/order", method = RequestMethod.GET)
    public String order(Model model) {
        User logUser = securityService.findLoggedUser();
        model.addAttribute("logUser", logUser);
        List<Order> ordersList= ordersService.getAllOrders();
        model.addAttribute("ordersList", ordersList);
        return "order";
    }

    @RequestMapping(value = "/order-detailed", method = RequestMethod.GET)
    public String orderDetailed(Model model, Long orderId) {
        Order order = ordersService.findById(orderId);
        model.addAttribute("order", order);
        return "order-detailed";
    }

    @RequestMapping(value = "/order-detailed", method = RequestMethod.POST)
    public String orderDetailed(@ModelAttribute("commentForm") Comment commentForm, BindingResult bindingResult, Model model, Long orderId) {
        if (bindingResult.hasErrors()) {
            return "order-detailed";
        }
        Order order = ordersService.findById(orderId);
        model.addAttribute("order", order);
        return "order-detailed";
    }

    //выводит страницу создания и редактирования новости
    @RequestMapping(value = {"/add-order","/edit-order"}, method = RequestMethod.GET)
    public String addOrder(Model model, Long orderId) {
        if(orderId!=null) {
            Order order = ordersService.findById(orderId);
            model.addAttribute("order", order);
        }
        else
            model.addAttribute("order", new Order() );
        model.addAttribute("allProjects", projectService.getAllProjects());
        return "add-order";
    }

    @RequestMapping(value = "/add-order", method = RequestMethod.POST)
    public String addOrder(@ModelAttribute("order") Order order, BindingResult bindingResult, Model model,@RequestParam("file") MultipartFile file) {
        if (bindingResult.hasErrors()) {
            return "add-order";
        }
        // Инициализируем неинициализированные поля
        order.setPhotoPath(uploadFile(file));
        order.setAuthor(securityService.findLoggedUser());
        order.setTimeOfCreation(new Timestamp(System.currentTimeMillis()));
        order.setTimeOfLastUpdate(new Timestamp(System.currentTimeMillis()));
        order.setProject(order.getProject() != null ? projectService.findById(order.getProject().getId()) : null);
        ordersService.save(order);
        return "redirect:/order";
    }

    @RequestMapping(value = "/edit-order", method = RequestMethod.POST)
    public String editOrder(@ModelAttribute("order") Order order, BindingResult bindingResult, Model model,@RequestParam("file") MultipartFile file) {
        if (bindingResult.hasErrors()) {
            return "add-order";
        }
        Order oldOrder= ordersService.findById(order.getId());
        if(oldOrder ==null) return "redirect:/order";
        if(file.getSize()>0)
            oldOrder.setPhotoPath(uploadFile(file));
        oldOrder.setEditor(securityService.findLoggedUser());
        oldOrder.setTimeOfLastUpdate(new Timestamp(System.currentTimeMillis()));
        oldOrder.setContent(order.getContent());
        oldOrder.setName(order.getName());
        oldOrder.setProject(order.getProject() != null ? projectService.findById(order.getProject().getId()) : null);
        ordersService.save(oldOrder);
        return "redirect:/order";
    }


    @RequestMapping(value = "/del-order", method = RequestMethod.GET)
    public String editOrder(Long orderId) {
        Order order = ordersService.findById(orderId);
        ordersService.delete(order);
        return "redirect:/order";
    }
}
