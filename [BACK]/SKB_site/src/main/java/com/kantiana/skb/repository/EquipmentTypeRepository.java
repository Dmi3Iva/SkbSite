package com.kantiana.skb.repository;

import com.kantiana.skb.model.EquipmentType;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by FTL on 08.06.2017.
 */
public interface EquipmentTypeRepository extends JpaRepository<EquipmentType, Long> {
    List<EquipmentType> findAllByEquipmentTypeIdOrderByTimeOfCreation(Long equipmentTypeId);

}
