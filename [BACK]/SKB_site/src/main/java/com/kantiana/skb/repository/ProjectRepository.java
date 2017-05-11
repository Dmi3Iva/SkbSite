package com.kantiana.skb.repository;

import com.kantiana.skb.model.Project;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProjectRepository extends JpaRepository<Project, Long> {
    public Project findByName();
}
