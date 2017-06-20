package com.kantiana.skb.repository;

import com.kantiana.skb.model.Equipment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface EquipmentRepository extends JpaRepository<Equipment, Long> {
    public Equipment findById(Long id);

    List<Equipment> findAllByEquipmentTypeIdOrderById(Long equipmentTypeId);

    public void deleteById(Long id);
}