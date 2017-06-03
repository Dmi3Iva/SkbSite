package com.kantiana.skb.service;

import com.kantiana.skb.model.User;

import java.util.List;

public interface UserService {
    public void save(User user);

    public void update(User user);

    public String encodePassword(String password);

    public User findByUsername(String username);

    public List<User> getAllUsers();

    public User findById(Long id);
}
