package com.kantiana.skb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.kantiana.skb.model.User;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Set;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);

    @Query("SELECT u FROM User u WHERE u.id NOT IN (SELECT pm.user.id FROM ProjectMembership pm WHERE pm.project.id = ?0)")
    List<User> findWhoIsNotInProject(Long projectId);
}