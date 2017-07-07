package com.kantiana.skb.repository;

import com.kantiana.skb.model.Request;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RequestRepository extends JpaRepository<Request, Long> {
    Request findById(Long id);

    List<Request> findByUserId(Long userId);
}
