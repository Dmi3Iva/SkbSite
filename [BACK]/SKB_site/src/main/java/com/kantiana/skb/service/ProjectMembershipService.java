package com.kantiana.skb.service;

import com.kantiana.skb.model.ProjectMembership;

import java.util.List;

public interface ProjectMembershipService {
    ProjectMembership findById(Long id);

    void removeById(Long id);

    List<ProjectMembership> findAllByProjectIdOrderByUserUsername(Long projectId);

    void save(ProjectMembership projectMembership);
}
