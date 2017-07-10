package com.kantiana.skb.service;

import com.kantiana.skb.model.User;
import com.sun.org.apache.xpath.internal.operations.Bool;

import java.util.List;

public interface UserService {
    void save(User user);

    void update(User user);

    User findByUsername(String username);

    List<User> findByChecked(Boolean checked);

    List<User> getAllUsers();

    User findById(Long id);

    String generatePassword();
}
