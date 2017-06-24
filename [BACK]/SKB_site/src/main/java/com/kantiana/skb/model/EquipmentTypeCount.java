package com.kantiana.skb.model;

import java.util.Arrays;
import java.util.Vector;

public class EquipmentTypeCount {
    Long id;
    Long count;
    String name;

    public EquipmentTypeCount() {
        this.id = -1L;
        this.count = 1L;
        this.name ="";
    }

    public EquipmentTypeCount(Long id, Long count) {
        this.id = id;
        this.count = count;
    }

    public EquipmentTypeCount(Long id, Long count, String name) {
        this.id = id;
        this.count = count;
        this.name = name;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }

    public void add(Long idType,Long count, String name){
        this.id = idType;
        this.count = count;
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
