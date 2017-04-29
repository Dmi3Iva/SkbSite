package com.kantiana.skb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.kantiana.skb.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
