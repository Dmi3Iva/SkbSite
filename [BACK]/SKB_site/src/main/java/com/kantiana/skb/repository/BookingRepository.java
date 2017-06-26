package com.kantiana.skb.repository;

import com.kantiana.skb.model.Booking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.sql.Date;
import java.util.List;

public interface BookingRepository extends JpaRepository<Booking, Long> {
    Booking findById(Long id);

    @Query("SELECT b FROM Booking b WHERE b.day = ?1 AND b.equipment.equipmentType.id = ?2")
    List<Booking> findByDayAndEquipmentType(Date day, Long equipmentTypeId);
}
