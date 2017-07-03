package com.kantiana.skb.repository;

import com.kantiana.skb.model.Equipment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface EquipmentRepository extends JpaRepository<Equipment, Long> {
    Equipment findById(Long id);

    List<Equipment> findAllByEquipmentTypeIdOrderByUniqueNumber(Long equipmentTypeId);

    void deleteById(Long id);

    Equipment findByUniqueNumber(String uniqueNumber);
}