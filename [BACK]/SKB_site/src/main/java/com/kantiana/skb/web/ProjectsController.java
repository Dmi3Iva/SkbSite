package com.kantiana.skb.web;

import com.kantiana.skb.model.Project;
import com.kantiana.skb.model.ProjectMembership;
import com.kantiana.skb.model.User;
import com.kantiana.skb.repository.ProjectStatusRepository;
import com.kantiana.skb.service.*;
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

@Controller
public class ProjectsController {
    @Autowired
    private ProjectService projectService;
    @Autowired
    private SecurityService securityService;
    @Autowired
    private ProjectStatusService projectStatusService;
    @Autowired
    private ProjectMembershipService projectMembershipService;
    @Autowired
    private UserService userService;

    //контроллеры проектов
    @RequestMapping(value = "/projects", method = RequestMethod.GET)
    public String projects(Model model) {
        List<Project> projectsList = projectService.getAllProjects();
        model.addAttribute("projectsList",projectsList);
        return "projects";
    }

    @RequestMapping(value = "/project-detailed", method = RequestMethod.GET)
    public String projectDetailed(Model model, @RequestParam("id") Long id) {
        Project project = projectService.findById(id);
        model.addAttribute("project", project);
        model.addAttribute("projectMemberships", projectMembershipService.findAllByProjectIdOrderByUserUsername(id));
        return "project-detailed";
    }

    @RequestMapping(value = {"/add-project", "/edit-project"}, method = RequestMethod.GET)
    public String addProject(Model model, Long id) {
        if (id != null) {
            Project project = projectService.findById(id);
            model.addAttribute("project", project);
            model.addAttribute("projectMemberships", projectMembershipService.findAllByProjectIdOrderByUserUsername(id));
            model.addAttribute("deletedProjectMembership", new ProjectMembership());
            model.addAttribute("newProjectMembership", new ProjectMembership());
            model.addAttribute("isEditing", true);
        }
        else {
            model.addAttribute("project", new Project());
            model.addAttribute("isEditing", false);
        }
        model.addAttribute("allProjectStatuses", projectStatusService.findAllByOrderById());
        return "add-project";
    }

    @RequestMapping(value = "/add-project", method = RequestMethod.POST)
    public String addProject(@ModelAttribute("project") Project project, BindingResult bindingResult, @RequestParam("file") MultipartFile image) {
        if (bindingResult.hasErrors()) {
            return "add-project";
        }
        projectService.saveNewProject(project, image);
        return "redirect:/projects";
    }

    @RequestMapping(value = "/edit-project", method = RequestMethod.POST)
    public String editProject(@ModelAttribute("project") Project project, BindingResult bindingResult, @RequestParam("file") MultipartFile image) {
        if (bindingResult.hasErrors()) {
            return "add-project";
        }
        projectService.saveUpdatedProject(project, image);
        return "redirect:/projects";
    }

    @RequestMapping(value = "/del-project", method = RequestMethod.GET)
    public String delProject(Long id) {
        projectService.delete(id);
        return "redirect:/projects";
    }

    //:TODO Метод должен быть POST
    @RequestMapping(value = "add-membership", method = RequestMethod.POST)
    public String addMembership(Long projectId, Long newMemberId) {
        ProjectMembership newProjectMembership = new ProjectMembership();
        newProjectMembership.setProject(projectService.findById(projectId));
        newProjectMembership.setUser(userService.findById(newMemberId));
        projectMembershipService.save(newProjectMembership);
        return "redirect:/project-detailed?id=" + projectId;
    }

    //:TODO Метод должен быть DELETE
    @RequestMapping(value = "/delete-membership", method = RequestMethod.POST)
    public String deleteMembership(Long projectId, Long deletedProjectMembershipId) {
        projectMembershipService.removeById(deletedProjectMembershipId);
        return "redirect:/project-detailed?id=" + projectId;
    }
}
