package com.kantiana.skb.service;

import com.kantiana.skb.model.Equipment;

import java.util.List;

public interface EquipmentService {
    public void save(Equipment equipment);

    List<Equipment> findAllByEquipmentTypeIdOrderById(Long equipmentTypeId);

    public Equipment findById(Long id);

    public void deleteById(Long id);
}
