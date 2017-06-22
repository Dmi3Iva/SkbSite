package com.kantiana.skb.model;

import java.util.Arrays;
import java.util.Vector;

public class EquipmentTypeCount {
    Long id;
    Long count;

    public EquipmentTypeCount() {
        this.id = -1L;
        this.count = 1L;
    }

    public EquipmentTypeCount(Long id, Long count) {
        this.id = id;
        this.count = count;
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

    public void add(Long idType,Long count){
        this.id = idType;
        this.count = count;
    }
}
