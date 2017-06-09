package com.kantiana.skb.service;

import com.kantiana.skb.model.Project;
import com.kantiana.skb.model.ProjectMembership;
import com.kantiana.skb.model.User;
import com.kantiana.skb.repository.ProjectMembershipRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjectMembershipServiceImpl implements ProjectMembershipService {
    @Autowired
    private ProjectMembershipRepository projectMembershipRepository;

    // Отображение
    @Override
    public ProjectMembership findById(Long id) {
        return projectMembershipRepository.findById(id);
    }

    @Override
    public List<ProjectMembership> findWhoIsProjectMember(Long projectId) {
        return projectMembershipRepository.findAllByProjectIdOrderByUserUsername(projectId);
    }

    // Удаление
    @Override
    public void removeById(Long id) {
        projectMembershipRepository.removeById(id);
    }

    // Сохранение
    @Override
    public void save(Project project, User member) {
        ProjectMembership projectMembership = new ProjectMembership();
        projectMembership.setProject(project);
        projectMembership.setUser(member);
        save(projectMembership);
    }

    @Override
    public void save(ProjectMembership projectMembership) {
        projectMembershipRepository.save(projectMembership);
    }
}
