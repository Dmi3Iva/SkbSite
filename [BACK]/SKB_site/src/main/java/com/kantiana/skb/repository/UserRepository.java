package com.kantiana.skb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.kantiana.skb.model.User;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Set;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}