package com.kantiana.skb.repository;

import com.kantiana.skb.model.AboutPage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.sql.Date;
import java.util.List;

public interface AboutPageRepository extends JpaRepository<AboutPage, Long> {
    AboutPage findById(Long id);
}
