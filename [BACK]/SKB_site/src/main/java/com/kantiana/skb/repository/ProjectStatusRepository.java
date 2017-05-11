package com.kantiana.skb.repository;

import com.kantiana.skb.model.ProjectStatus;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProjectStatusRepository extends JpaRepository<ProjectStatus, Long> {
    public ProjectStatus findByName(String name);
}
