package com.kantiana.skb.repository;

import com.kantiana.skb.model.Booking;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BookingRepository extends JpaRepository<Booking, Long> {
        public Booking findById(Long id);
}
