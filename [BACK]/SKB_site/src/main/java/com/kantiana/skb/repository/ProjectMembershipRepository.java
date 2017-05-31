package com.kantiana.skb.repository;

import com.kantiana.skb.model.ProjectMembership;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.transaction.Transactional;
import java.util.List;

public interface ProjectMembershipRepository extends JpaRepository<ProjectMembership, Long> {
    ProjectMembership findById(Long id);

    @Transactional
    void removeById(Long id);

    List<ProjectMembership> findAllByProjectIdOrderByUserUsername(Long projectId);
}
