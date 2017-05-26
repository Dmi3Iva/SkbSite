package com.kantiana.skb.service;

import com.kantiana.skb.model.Order;
import com.kantiana.skb.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrdersServiceImpl implements OrdersService {
    @Autowired
    private OrderRepository orderRepository;

    public void save(Order news) {
        orderRepository.save(news);
    }

    public void delete(Long newsId){
        orderRepository.delete(newsId);
    }

    public void delete(Order news) {
        orderRepository.delete(news);
    }

    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }

    @Override
    public Order findById(Long id) {
        return orderRepository.findById(id);
    }
}
