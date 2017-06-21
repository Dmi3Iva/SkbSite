package com.kantiana.skb.service;

import com.kantiana.skb.model.Role;
import com.kantiana.skb.model.User;
import com.kantiana.skb.repository.RoleRepository;
import com.kantiana.skb.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    final String ROLE_MEMBER = "ROLE_MEMBER",
               ROLE_CUSTOMER = "ROLE_CUSTOMER";

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    @Override
    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        // Устанавливаем начальную роль
        Set<Role> roles = new HashSet<Role>();
        if (user.isCustomer()) {
            roles.add(roleRepository.findByName(ROLE_CUSTOMER));
        }
        else {
            roles.add(roleRepository.findByName(ROLE_MEMBER));
        }
        user.setRoles(roles);
        userRepository.save(user);
    }

    public void update(User user){
        userRepository.save(user);
    }

    public User findById(Long id){
        return userRepository.findOne(id);
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public String generatePassword() {
        Random random = new Random();
        String alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder password = new StringBuilder();
        int idx, passwordLength = 10;
        char c;
        for (int i = 0; i < passwordLength; ++i) {
            idx = random.nextInt(alphabet.length());
            c = alphabet.charAt(idx);
            password.append(c);
        }
        return password.toString();
    }
}
