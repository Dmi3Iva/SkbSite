package com.kantiana.skb.repository;

import com.kantiana.skb.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long>{
}

