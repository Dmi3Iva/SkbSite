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
    public List<User> findProjectMembers(Long projectId) {
        return projectMembershipRepository.findProjectMembers(projectId);
    }

    @Override
    public List<User> findProjectMembersExceptCaptain(Long projectId) {
        return projectMembershipRepository.findProjectMembersExceptCaptain(projectId);
    }

    @Override
    public List<User> findNonProjectMembers(Long projectId) {
        return projectMembershipRepository.findNonProjectMembers(projectId);
    }

    // Удаление
    @Override
    public void removeById(Long id) {
        if (id == null) {
            return;
        }
        projectMembershipRepository.removeById(id);
    }

    @Override
    public void remove(Long projectId, Long memberId) {
        if (projectId == null || memberId == null) {
            return;
        }
        projectMembershipRepository.removeByProjectIdAndUserId(projectId, memberId);
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
