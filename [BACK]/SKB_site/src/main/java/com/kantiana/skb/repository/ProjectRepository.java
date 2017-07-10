package com.kantiana.skb.repository;

import com.kantiana.skb.model.Project;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProjectRepository extends JpaRepository<Project, Long> {
    Project findByName(String name);

    Project findById(Long id);

    List<Project> findAllByOrderByName();

    List<Project> findByChecked(Boolean cheked);

    @Query ("SELECT n FROM Project n ORDER BY n.dateOfStart DESC")
    List<Project> findTop();
}
