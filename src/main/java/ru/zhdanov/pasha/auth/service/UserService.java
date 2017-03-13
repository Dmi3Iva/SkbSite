package ru.zhdanov.pasha.auth.service;

import ru.zhdanov.pasha.auth.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}