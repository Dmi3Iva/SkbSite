package com.kantiana.skb.service;

import com.kantiana.skb.model.Project;
import com.kantiana.skb.model.ProjectMembership;
import com.kantiana.skb.model.User;

import java.util.List;

public interface ProjectMembershipService {
    ProjectMembership findById(Long id);

    void removeById(Long id);

    List<ProjectMembership> findWhoIsProjectMember(Long projectId);

    void save(ProjectMembership projectMembership);

    void save(Project project, User member);
}
