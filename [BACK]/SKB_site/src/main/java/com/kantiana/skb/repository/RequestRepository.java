package com.kantiana.skb.repository;

import com.kantiana.skb.model.Request;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RequestRepository extends JpaRepository<Request, Long> {
    public Request findById(Long id);
}
