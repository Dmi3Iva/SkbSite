package com.kantiana.skb.service;

import com.kantiana.skb.model.ProjectStatus;
import com.kantiana.skb.repository.ProjectStatusRepository;
import org.omg.PortableInterceptor.ACTIVE;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class ProjectStatusServiceImpl implements ProjectStatusService {
    @Autowired
    private ProjectStatusRepository projectStatusRepository;

    private enum Status {
        ACTIVE, FROZEN, COMPLETED
    };

    public List<ProjectStatus> findAllByOrderById() {
        return projectStatusRepository.findAllByOrderById();
    }

    public ProjectStatus findById(Long id) {
        return projectStatusRepository.findById(id);
    }

    public ProjectStatus getStatusActive() {
        return projectStatusRepository.findById(new Long(Status.ACTIVE.ordinal()));
    }

    public ProjectStatus getStatusFrozen() {
        return projectStatusRepository.findById(2L);
    }

    public ProjectStatus getStatusCompleted() {
        return projectStatusRepository.findById(3L);
    }
}
