package com.kantiana.skb.model;

import org.springframework.stereotype.Controller;

import javax.persistence.*;

@Controller
@Table(name = "equipment")
public class Equipment {
    private Long id;
    private EquipmentType equipmentType;
    private String uniqueNumber;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    public EquipmentType getEquipmentType() {
        return equipmentType;
    }

    public String getUniqueNumber() {
        return uniqueNumber;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setEquipmentType(EquipmentType equipmentType) {
        this.equipmentType = equipmentType;
    }

    public void setUniqueNumber(String uniqueNumber) {
        this.uniqueNumber = uniqueNumber;
    }
}
