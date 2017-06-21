package com.kantiana.skb.model;

import java.util.Arrays;
import java.util.Vector;

public class EquipmentTypeCount {
    Vector<Long> id;
    Vector<Long> count;

    public EquipmentTypeCount() {
        this.id = new Vector<Long>();
        this.count = new Vector<Long>();
    }

    public EquipmentTypeCount(Vector<Long> id, Vector<Long> count) {
        this.id = id;
        this.count = count;
    }

    public void add(Long id, Long count)
    {
        if(this.id==null)
            this.id = new Vector<Long>();
        if(this.count==null)
            this.count = new Vector<Long>();
        this.id.add(id);
        this.count.add(count);

    }
    public Vector<Long> getId() {
        return id;
    }

    public void setId(Vector<Long> id) {
        this.id = id;
    }

    public Vector<Long> getCount() {
        return count;
    }

    public void setCount(Vector<Long> count) {
        this.count = count;
    }
}
