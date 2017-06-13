package com.kantiana.skb.service;

import com.kantiana.skb.model.Project;
import com.kantiana.skb.model.ProjectMembership;
import com.kantiana.skb.model.User;

import java.util.List;

public interface ProjectMembershipService {
    ProjectMembership findById(Long id);

    void removeById(Long id);
    void remove(Long projectId, Long memberId);

    List<User> findProjectMembers(Long projectId);
    List<User> findProjectMembersExceptCaptain(Long projectId);
    List<User> findNonProjectMembers(Long projectId);

    List<Project> findProjectsWhereUserIsMember(Long userId);

    void save(ProjectMembership projectMembership);

    void save(Project project, User member);
}
