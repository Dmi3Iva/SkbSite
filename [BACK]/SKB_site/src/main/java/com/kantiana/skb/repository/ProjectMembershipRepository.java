package com.kantiana.skb.repository;

import com.kantiana.skb.model.Project;
import com.kantiana.skb.model.ProjectMembership;
import com.kantiana.skb.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;
import java.util.List;

public interface ProjectMembershipRepository extends JpaRepository<ProjectMembership, Long> {
    ProjectMembership findById(Long id);

    @Transactional
    void removeById(Long id);

    @Transactional
    void removeByProjectIdAndUserId(Long projectId, Long userId);

    List<ProjectMembership> findAllByProjectIdOrderByUserUsername(Long projectId);

    @Query("SELECT pm.user FROM ProjectMembership pm " +
            "WHERE (pm.project.id = ?1) " +
            "ORDER BY pm.user.username")
    List<User> findProjectMembers(Long projectId);

    @Query("SELECT pm.user FROM ProjectMembership pm " +
            "WHERE (pm.project.id = ?1 AND pm.user.id <> pm.project.captain.id) " +
            "ORDER BY pm.user.username")
    List<User> findProjectMembersExceptCaptain(Long projectId);

    @Query("SELECT u FROM User u WHERE u.id NOT IN " +
            "(SELECT pm.user.id FROM ProjectMembership pm WHERE pm.project.id = ?1) " +
            "ORDER BY u.username")
    List<User> findNonProjectMembers(Long projectId);

    @Query("SELECT pm.project FROM ProjectMembership pm W" +
            "HERE pm.user.id = ?1 ORDER BY pm.project.name")
    List<Project> findProjectsWhereUserIsMember(Long userId);
}
