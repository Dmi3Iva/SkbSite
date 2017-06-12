package com.kantiana.skb.repository;

import com.kantiana.skb.model.ProjectStatus;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProjectStatusRepository extends JpaRepository<ProjectStatus, Long> {
    ProjectStatus findByName(String name);

    List<ProjectStatus> findAllByOrderById();

    ProjectStatus findById(Long id);
}
