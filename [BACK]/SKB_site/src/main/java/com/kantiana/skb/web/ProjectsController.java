package com.kantiana.skb.web;

import com.kantiana.skb.model.Project;
import com.kantiana.skb.model.ProjectMembership;
import com.kantiana.skb.repository.ProjectStatusRepository;
import com.kantiana.skb.service.ProjectMembershipService;
import com.kantiana.skb.service.ProjectService;
import com.kantiana.skb.service.ProjectStatusService;
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
            model.addAttribute("projectMembers", projectMembershipService.findAllByProjectIdOrderByUserUsername(id));
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
//        Project project = projectService.findById(id);
//        projectService.delete(project);
        projectService.delete(id);
        return "redirect:/projects";
    }

    @RequestMapping(value = "/add-member", method = RequestMethod.POST)
    public String addMember(@ModelAttribute("membershipForm") ProjectMembership membershipForm, BindingResult bindingResult) {
        projectMembershipService.save(membershipForm);
        return "redirect:/project-detailed?id=" + membershipForm.getProject().getId();
    }

    @RequestMapping(value = "/del-member", method = RequestMethod.GET)
    public String delMember(@RequestParam("projectMembershipId") Long projectMembershipId) {
        Long projectId = projectMembershipService.findById(projectMembershipId).getProject().getId();
        projectMembershipService.removeById(projectMembershipId);
        return "redirect:/project-detailed?id=" + projectId;
    }
}
