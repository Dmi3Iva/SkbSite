package com.kantiana.skb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.kantiana.skb.model.Order;

public interface OrderRepository extends JpaRepository<Order, Long> {
    public Order findById(Long id);
}
