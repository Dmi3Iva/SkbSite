package ru.zhdanov.pasha.auth.service;


public interface SecurityService {
    String findLoggedInUsername();

    void autologin(String username, String password);
}