package com.kantiana.skb.service;

import com.kantiana.skb.model.User;

import java.util.List;

public interface UserService {
    void save(User user);

    void update(User user);

    User findByUsername(String username);

    List<User> getAllUsers();

    User findById(Long id);
}
