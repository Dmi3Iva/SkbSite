package com.hellokoding.account.service;

import com.hellokoding.account.model.User;

import java.util.List;

public interface UserService {
    void save(User user);

    User findByUsername(String username);

    List<User> getAll();
}
