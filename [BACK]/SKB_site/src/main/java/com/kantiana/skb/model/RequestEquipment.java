package com.kantiana.skb.model;


import javax.validation.OverridesAttribute;
import java.util.*;

public class RequestEquipment {

    private Vector<EquipmentTypeCount> equipmentTypeCount;
    private Date date;
    private Map<String,Long> time;

    public RequestEquipment() {

        this.makeTime();
        this.date = new Date();
        this.equipmentTypeCount = new Vector<EquipmentTypeCount>();
    }

    public Vector<EquipmentTypeCount> getEquipmentTypeCount() {
        return equipmentTypeCount;
    }

    public void setEquipmentTypeCount(Vector<EquipmentTypeCount> equipmentTypeCount) {
        this.equipmentTypeCount = equipmentTypeCount;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Map<String, Long> getTime() {
        return time;
    }

    public void setTime(Map<String, Long> time) {
        this.time = time;
    }

    public int getSize(){
        return this.equipmentTypeCount.size();
    }

    public void add(Long idType, Long count){
        this.equipmentTypeCount.add(new EquipmentTypeCount(idType,count));
    }

    public void makeTime(){
        time = new HashMap<String, Long>();
        this.time.put("8.30-9.00",0L);
        this.time.put("9.00-9.30", 1L);
        this.time.put("9.30-10.00",2L);
        this.time.put("10.00-10.30",3L);
        this.time.put("10.30-11.00",4L);
        this.time.put("11.30-12.00",5L);
        this.time.put("12.00-12.30",6L);
        this.time.put("12.30-13.00",7L);
        this.time.put("13.00-13.30",8L);
        this.time.put("13.30-14.00",9L);
        this.time.put("14.00-14.30",10L);
        this.time.put("14.30-15.00",11L);
        this.time.put("15.00-15.30",12L);
        this.time.put("15.30-16.00",13L);
        this.time.put("16.00-16.30",14L);
        this.time.put("16.30-17.00",15L);
        this.time.put("17.00-17.30",16L);
        this.time.put("17.30-18.00",17L);
        this.time.put("18.00-18.30",18L);
    }
}
