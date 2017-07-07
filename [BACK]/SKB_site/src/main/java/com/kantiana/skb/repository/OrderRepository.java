package com.kantiana.skb.repository;

import com.sun.org.apache.xpath.internal.operations.Or;
import org.springframework.data.jpa.repository.JpaRepository;
import com.kantiana.skb.model.Order;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Long> {
    public Order findById(Long id);

    List<Order> findByChecked(Boolean checked);
}
