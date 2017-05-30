package com.kantiana.skb.service;

import com.kantiana.skb.model.ProjectStatus;
import com.kantiana.skb.repository.ProjectStatusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

public interface ProjectStatusService {
    List<ProjectStatus> findAllByOrderById();

    ProjectStatus findById(Long id);

    ProjectStatus getStatusActive();

    ProjectStatus getStatusFrozen();

    ProjectStatus getStatusCompleted();
}
