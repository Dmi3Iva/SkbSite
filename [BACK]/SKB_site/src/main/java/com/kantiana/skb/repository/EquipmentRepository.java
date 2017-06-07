package com.kantiana.skb.repository;

import com.kantiana.skb.model.Equipment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface EquipmentRepository extends JpaRepository<Equipment, Long> {
    List<Equipment> findAllByEquipmentIdOrderByTimeOfCreation(Long equipmentId);
}