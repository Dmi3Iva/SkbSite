package com.kantiana.skb.model;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.Mapping;

import javax.persistence.*;

@Entity
@Table(name = "equipment")
public class Equipment {
    private Long id;
    private EquipmentType equipmentType;
    private String uniqueNumber;

    private Booking booking;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    @ManyToOne(fetch = FetchType.LAZY, targetEntity = EquipmentType.class)
    @JoinColumn(name = "equipment_type_id")
    public EquipmentType getEquipmentType() {
        return equipmentType;
    }

    public String getUniqueNumber() {
        return uniqueNumber;
    }

    @OneToOne(mappedBy = "equipment")
    public Booking getBooking() {
        return booking;
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

    public void setBooking(Booking booking) {
        this.booking = booking;
    }
}
