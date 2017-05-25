package com.kantiana.skb.service;

import com.kantiana.skb.model.Order;
import java.util.List;

public interface OrderService {
    public void save(Order news);

    public List<Order> getAllNews();

    public Order findById(Long id);

    public void delete(Long orderId);

    public void delete(Order order);


}
