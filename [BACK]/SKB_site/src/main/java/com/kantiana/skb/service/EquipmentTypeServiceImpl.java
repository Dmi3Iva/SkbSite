package com.kantiana.skb.service;

import com.kantiana.skb.model.Equipment;
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

    public void save(EquipmentType equipmentType)
    {
        equipmentTypeRepository.save(equipmentType);
    }

    public EquipmentType findById(Long id){
        return equipmentTypeRepository.findById(id);
    }

    public void delete(EquipmentType equipmentType)
    {
        equipmentTypeRepository.delete(equipmentType);
    }

    public void delete(Long id)
    {
        equipmentTypeRepository.delete(id);
    }

}