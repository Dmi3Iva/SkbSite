package com.kantiana.skb.service;

import com.kantiana.skb.model.Project;
import com.kantiana.skb.model.ProjectMembership;
import com.kantiana.skb.repository.ProjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Service;
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

    @Autowired
    private ProjectMembershipService projectMembershipService;

    public void saveNewProject(Project project) {
        project.setCaptain(securityService.findLoggedUser());
        project.setDateOfStart(new Date(System.currentTimeMillis()));
        project.setDateOfLastUpdate(new Date(System.currentTimeMillis()));
        project.setProjectStatus(projectStatusService.getStatusActive()); // Указываем статус "Активен"
        project.setStatusPercent(0L);
        project.setDateOfLastUpdate(new Date(System.currentTimeMillis()));
        projectRepository.save(project);
        projectMembershipService.save(project, project.getCaptain());
    }

    public void saveUpdatedProjectFull(Project project) {
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
            projectRepository.save(oldProject);
        }
    }

    public void saveUpdatedProject(Project project) {
        saveUpdatedProjectFull(project);
    }

    public Project findByName(String name) {
        return projectRepository.findByName(name);
    }

    public Project findById(Long id) {
        return projectRepository.findById(id);
    }

    public List<Project> getAllProjects() {
        return projectRepository.findAllByOrderByName();
    }

    /*этот метод не работатает*/
    public void delete(Project project){
        projectRepository.delete(project);
    }

    public void delete(Long id){
        projectRepository.delete(id);
    }

    public List<Project> findTop(int number) {
        List<Project> topList = projectRepository.findTop();
        while (number < topList.size()){
            topList.remove(number);
        }
        return topList;
    }
}
