package com.kantiana.skb.service;

import com.kantiana.skb.model.Project;
import com.kantiana.skb.repository.ProjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjectServiceImpl implements ProjectService {
    @Autowired
    private ProjectRepository projectRepository;

    public void save(Project project) {
        projectRepository.save(project);
    }

    public Project findByName(String name) {
        return projectRepository.findByName();
    }

    public List<Project> getAllProjects() {
        return projectRepository.findAll();
    }
}
