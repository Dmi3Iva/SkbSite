package com.kantiana.skb.service;

import com.kantiana.skb.model.Project;
import com.kantiana.skb.repository.ProjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;

import static com.kantiana.skb.web.WorkingWithFile.uploadFile;

@Service
public class ProjectServiceImpl implements ProjectService {
    @Autowired
    private ProjectRepository projectRepository;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private ProjectStatusService projectStatusService;

    public void saveNewProject(Project project, MultipartFile image) {
        project.setCaptain(securityService.findLoggedUser());
        project.setDateOfStart(new Date(System.currentTimeMillis()));
        project.setDateOfLastUpdate(new Date(System.currentTimeMillis()));
        project.setProjectStatus(projectStatusService.findById(projectStatusService)); // Указываем статус "Активен"
        project.setStatusPercent(new Long(0));
        if(image.getSize() > 0) {
            project.setPhotoPath(uploadFile(image));
        }
        project.setDateOfLastUpdate(new Date(System.currentTimeMillis()));
        projectRepository.save(project);
    }

    public void saveUpdatedProject(Project project, MultipartFile image) {
        Project oldProject = projectRepository.findById(project.getId());
        if (oldProject != null) {
            oldProject.setDateOfLastUpdate(new Date(System.currentTimeMillis()));
            if (project.getName() != null) {
                oldProject.setName(project.getName());
            }
            if (project.getAbout() != null) {
                oldProject.setAbout(project.getAbout());
            }
            if (project.getCaptain() != null) {
                oldProject.setCaptain(project.getCaptain());
            }
            if (project.getProjectStatus() != null) {
                oldProject.setProjectStatus(project.getProjectStatus());
            }
            if (project.getStatusPercent() != null) {
                oldProject.setStatusPercent(project.getStatusPercent());
            }
            if (image.getSize() > 0) {
                oldProject.setPhotoPath(uploadFile(image));
            }
            projectRepository.save(oldProject);
        }
    }

    public Project findByName(String name) {
        return projectRepository.findByName(name);
    }

    public Project findById(Long id) {
        return projectRepository.findById(id);
    }

    public List<Project> getAllProjects() {
        return projectRepository.findAll();
    }

    /*этот метод не работатает*/
    public void delete(Project project){
        projectRepository.delete(project);
    }

    public void delete(Long id ){
        projectRepository.delete(id);
    }
}
