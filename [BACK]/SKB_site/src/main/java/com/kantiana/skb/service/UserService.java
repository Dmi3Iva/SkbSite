package com.kantiana.skb.service;

import com.kantiana.skb.model.User;

import java.util.List;

public interface UserService {
    public void save(User user);

    public User findByUsername(String username);

    public List<User> getAll();
}
