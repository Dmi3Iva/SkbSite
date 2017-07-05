package com.kantiana.skb.service;

import com.kantiana.skb.model.Equipment;

import java.util.List;

public interface EquipmentService {
    void save(Equipment equipment);

    List<Equipment> findAllByEquipmentTypeId(Long equipmentTypeId);

    Equipment findById(Long id);

    void deleteById(Long id);

    Equipment findByUniqueNumber(String uniqueNumber);

    int countByEquipmentTypeId(Long equipmentTypeId);
}
