package com.kantiana.skb.service;

import com.kantiana.skb.model.Project;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ProjectService {
    // Создает новый проект
    void saveNewProject(Project project);

    // Обновляет существующий проект
    void saveUpdatedProjectFull(Project project);
    void saveUpdatedProject(Project project);

    Project findByName(String name);

    List<Project> getAllProjects();

    Project findById(Long id);

    void delete(Project project);

    void delete(Long id );

    List<Project> findTop(int number);
}
