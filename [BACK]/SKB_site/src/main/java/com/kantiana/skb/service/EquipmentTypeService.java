package com.kantiana.skb.service;

import com.kantiana.skb.model.EquipmentType;

import java.util.List;

public interface EquipmentTypeService {
    public List<EquipmentType> getAllEquipmentType();

    public void save(EquipmentType equipmentType);

    public EquipmentType findById(Long id);

    public void delete(EquipmentType equipmentType);

    public void delete(Long id);
}
