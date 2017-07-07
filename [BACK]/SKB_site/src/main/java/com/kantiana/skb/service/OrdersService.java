package com.kantiana.skb.service;

import com.kantiana.skb.model.Order;
import java.util.List;

public interface OrdersService {
    public void save(Order news);

    public List<Order> getAllOrders();

    public Order findById(Long id);

    public void delete(Long orderId);

    public void delete(Order order);

    public List<Order> findByChecked(Boolean checked);

}
