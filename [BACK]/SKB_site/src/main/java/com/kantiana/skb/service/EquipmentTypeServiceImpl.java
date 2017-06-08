package com.kantiana.skb.service;

import com.kantiana.skb.model.EquipmentType;
import com.kantiana.skb.repository.EquipmentTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EquipmentTypeServiceImpl implements EquipmentTypeService {
    @Autowired
    EquipmentTypeRepository equipmentTypeRepository;

    @Override
    public List<EquipmentType> getAllEquipmentType() {
        return equipmentTypeRepository.findAll();
    }
}