package com.kantiana.skb.service;

import com.kantiana.skb.model.ProjectStatus;
import com.kantiana.skb.repository.ProjectStatusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjectStatusServiceImpl implements ProjectStatusService {
    @Autowired
    private ProjectStatusRepository projectStatusRepository;

    public List<ProjectStatus> findAllByOrderById() {
        return projectStatusRepository.findAllByOrderById();
    }

    public ProjectStatus findById(Long id) {
        return projectStatusRepository.findById(id);
    }

    /* ВНИМАНИЕ!!! КОСТЫЛИ!!! Смотри функции getStatus*/

    public ProjectStatus getStatusActive() {
        return projectStatusRepository.findByName("ACTIVE"); // Статус "активен" в бд должен называться "ACTIVE"
    }

    public ProjectStatus getStatusFrozen() {
        return projectStatusRepository.findByName("FROZEN"); // Статус "заморожен" в бд должен называться "FROZEN"
    }

    public ProjectStatus getStatusCompleted() {
        return projectStatusRepository.findByName("COMPLETED"); // Статус "завершен" в бд должен называться "COMPLETED"
    }
}
