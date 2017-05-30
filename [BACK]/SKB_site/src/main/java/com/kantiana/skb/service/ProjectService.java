package com.kantiana.skb.service;

import com.kantiana.skb.model.Project;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ProjectService {
    // Создает новый проект
    void saveNewProject(Project project, MultipartFile image);

    // Обновляет существующий проект
    void saveUpdatedProject(Project project, MultipartFile image);

    Project findByName(String name);

    List<Project> getAllProjects();

    Project findById(Long id);

    void delete(Project project);

    void delete(Long id );
}
