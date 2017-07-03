package com.kantiana.skb.web;

import com.kantiana.skb.model.Project;
import com.kantiana.skb.model.ProjectMembership;
import com.kantiana.skb.model.Role;
import com.kantiana.skb.model.User;
import com.kantiana.skb.repository.ProjectRepository;
import com.kantiana.skb.repository.ProjectStatusRepository;
import com.kantiana.skb.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
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
        User logUser = securityService.findLoggedUser();
        model.addAttribute("logUser", logUser);
        List<Project> projectsList = projectService.getAllProjects();
        model.addAttribute("projectsList",projectsList);
        return "projects";
    }

    @RequestMapping(value = "/project-detailed", method = RequestMethod.GET)
    public String projectDetailed(Model model, @RequestParam("projectId") Long projectId) {
        Project project = projectService.findById(projectId);
        User logUser = securityService.findLoggedUser();
        model.addAttribute("logUser", logUser);
        model.addAttribute("project", project);
        model.addAttribute("projectTeam", projectMembershipService.findProjectMembers(projectId));
        return "project-detailed";
    }

    @RequestMapping(value = "/add-project", method = RequestMethod.GET)
    public String addProject(Model model) {
        User logUser = securityService.findLoggedUser();
        if (logUser.getUsername() == null ||
            logUser.getRole().getName().equals("ROLE_CUSTOMER")){
            return "redirect:/error403";
        }
        model.addAttribute("project", new Project());
        model.addAttribute("isEditing", false);
        model.addAttribute("allProjectStatuses", projectStatusService.findAllByOrderById());
        return "add-project";
    }

    @RequestMapping(value = "/edit-project", method = RequestMethod.GET)
    public String editProject(Model model, Long projectId) {
        Project project = projectService.findById(projectId);
        model.addAttribute("project", project);
        model.addAttribute("projectTeamExceptCaptain", projectMembershipService.findProjectMembersExceptCaptain(projectId));
        model.addAttribute("nonProjectMembers", projectMembershipService.findNonProjectMembers(projectId));
        model.addAttribute("isEditing", true);
        model.addAttribute("allProjectStatuses", projectStatusService.findAllByOrderById());
        //для борьбы с незаконным доступом
        User logUser = securityService.findLoggedUser();
        User author = project.getCaptain();

        if (logUser.getId() != author.getId() &&
            !logUser.getRole().getName().equals("ROLE_MODERATOR") &&
            !logUser.getRole().getName().equals("ROLE_ADMIN")){
            return "redirect:/error403";
        }
        return "add-project";
    }

    @RequestMapping(value = "/add-project", method = RequestMethod.POST)
    public String addProject(@ModelAttribute("project") Project project, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "add-project";
        }
        projectService.saveNewProject(project);
        return "redirect:/projects";
    }

    @RequestMapping(value = "/edit-project", method = RequestMethod.POST)
    public String editProject(@ModelAttribute("project") Project project, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "add-project";
        }
        projectService.saveUpdatedProject(project);
        return "redirect:/projects";
    }

    //:TODO Метод должен быть DELETE
    @RequestMapping(value = "/delete-project", method = RequestMethod.POST)
    public String deleteProject(Long projectId) {
        projectService.delete(projectId);
        return "redirect:/projects";
    }

    @RequestMapping(value = "add-membership", method = RequestMethod.POST)
    public String addMembership(Long projectId, Long newMemberId) {
        ProjectMembership newProjectMembership = new ProjectMembership();
        newProjectMembership.setProject(projectService.findById(projectId));
        newProjectMembership.setUser(userService.findById(newMemberId));
        projectMembershipService.save(newProjectMembership);
        return "redirect:/edit-project?projectId=" + projectId;
    }

    //:TODO Метод должен быть DELETE
    @RequestMapping(value = "/delete-membership", method = RequestMethod.POST)
    public String deleteMembership(Long projectId, Long memberId) {
        projectMembershipService.remove(projectId, memberId);
        return "redirect:/edit-project?projectId=" + projectId;
    }

    @RequestMapping(value = "/change-captain", method = RequestMethod.POST)
    public String changeCaptain(Long projectId, Long captainId) {
        Project project = projectService.findById(projectId);
        User captain = userService.findById(captainId);
        if (project != null && captain != null) {
            project.setCaptain(captain);
            projectService.saveUpdatedProject(project);
        }
        return "redirect:/edit-project?projectId=" + projectId;
    }
}
