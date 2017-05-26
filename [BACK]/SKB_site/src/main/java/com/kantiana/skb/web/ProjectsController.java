package com.kantiana.skb.web;

import com.kantiana.skb.model.CommentForProject;
import com.kantiana.skb.model.Project;
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

import java.sql.Date;
import java.util.List;

import static com.kantiana.skb.web.WorkingWithFile.uploadFile;

@Controller
public class ProjectsController {
    @Autowired
    private ProjectService projectService;
    @Autowired
    private SecurityService securityService;

    //контроллеры проектов
    @RequestMapping(value = "/projects", method = RequestMethod.GET)
    public String projects(Model model) {
        List<Project> projectsList = projectService.getAllProjects();
        model.addAttribute("projectsList",projectsList);
        return "projects";
    }

    @RequestMapping(value = "/project-detailed", method = RequestMethod.GET)
    public String projectDetailed(Model model, Long id) {
        Project project = projectService.findById(id);
        model.addAttribute("project", project);
        return "project-detailed";
    }

    @RequestMapping(value = {"/add-project","/edit-project"}, method = RequestMethod.GET)
    public String addProject(Model model, Long id) {
        if(id!=null) {
            Project project = projectService.findById(id);
            model.addAttribute("project", project);
        }
        else
            model.addAttribute("project", new Project() );
        return "add-project";
    }

    @RequestMapping(value = "/add-project", method = RequestMethod.POST)
    public String addProject(@ModelAttribute("project") Project project, BindingResult bindingResult, @RequestParam("file") MultipartFile file) {
        if (bindingResult.hasErrors()) {
            return "add-project";
        }

//        project.setProjectStatus();
//        project.setStatusPercent();
        if(file.getSize()>0) project.setPhotoPath(uploadFile(file));
        project.setCaptain(securityService.findLoggedUser());
        project.setDateOfStart(new Date(System.currentTimeMillis()));
        project.setDateOfLastUpdate(new Date(System.currentTimeMillis()));
//        project.setAbout(project.getAbout()); // пока null
//        project.setName(project.getName());
        projectService.save(project);
        return "redirect:/projects";
    }

    @RequestMapping(value = "/edit-project", method = RequestMethod.POST)
    public String editProject(@ModelAttribute("project") Project project, BindingResult bindingResult, @RequestParam("file") MultipartFile file) {
        if (bindingResult.hasErrors()) {
            return "add-project";
        }
        Project oldProject= projectService.findById(project.getId());
        if(oldProject ==null) return "redirect:/project";

        if(file.getSize()>0)
            oldProject.setPhotoPath(uploadFile(file));
        oldProject.setCaptain(securityService.findLoggedUser());
        oldProject.setDateOfLastUpdate(new Date(System.currentTimeMillis()));
        oldProject.setStatusPercent(project.getStatusPercent()); // пока null
        oldProject.setAbout(project.getAbout());
        oldProject.setStatusPercent(project.getStatusPercent());
        oldProject.setProjectStatus(project.getProjectStatus());
        oldProject.setName(project.getName());

        projectService.save(oldProject);
        return "redirect:/projects";
    }


    @RequestMapping(value = "/del-project", method = RequestMethod.GET)
    public String delProject(Long id) {
        Project project = projectService.findById(id);
        projectService.delete(project);
        projectService.delete(id);
        return "redirect:/projects";
    }
}
