package com.kantiana.skb.model;

import javax.validation.OverridesAttribute;
import java.util.*;

public class RequestEquipment {

    private List<EquipmentTypeCount> equipmentTypeCount;
    private Date date;
    private List<String> timeChoose;
    private List<String> timeList;

    public RequestEquipment() {
        this.timeList = new ArrayList<String>();
        this.makeTimeList();
        this.timeChoose = new ArrayList<String>();
        this.date = new Date();
        this.equipmentTypeCount = new Vector<EquipmentTypeCount>();
    }

    public List<EquipmentTypeCount> getEquipmentTypeCount() {
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

    public void setEquipmentTypeCount(List<EquipmentTypeCount> equipmentTypeCount) {
        this.equipmentTypeCount = equipmentTypeCount;
    }

    public List<String> getTimeChoose() {
        return timeChoose;
    }

    public void setTimeChoose(List<String> timeChoose) {
        this.timeChoose = timeChoose;
    }

    public List<String> getTimeList() {
        return timeList;
    }

    public void setTimeList(List<String> timeList) {
        this.timeList = timeList;
    }

    public int getSize(){
        return this.equipmentTypeCount.size();
    }

    public void add(Long idType, Long count, String name){
        this.equipmentTypeCount.add(new EquipmentTypeCount(idType,count, name));
    }

    public void makeTimeList(){
        this.timeList.add("8.30-9.00");
        this.timeList.add("9.00-9.30");
        this.timeList.add("9.30-10.00");
        this.timeList.add("10.00-10.30");
        this.timeList.add("10.30-11.00");
        this.timeList.add("11.30-12.00");
        this.timeList.add("12.00-12.30");
        this.timeList.add("12.30-13.00");
        this.timeList.add("13.00-13.30");
        this.timeList.add("13.30-14.00");
        this.timeList.add("14.00-14.30");
        this.timeList.add("14.30-15.00");
        this.timeList.add("15.00-15.30");
        this.timeList.add("15.30-16.00");
        this.timeList.add("16.00-16.30");
        this.timeList.add("16.30-17.00");
        this.timeList.add("17.00-17.30");
        this.timeList.add("17.30-18.00");
        this.timeList.add("18.00-18.30");
    }
}
