package com.kantiana.skb.repository;

import com.kantiana.skb.model.EquipmentType;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface EquipmentTypeRepository extends JpaRepository<EquipmentType, Long> {
    public EquipmentType findById(Long id);

}
